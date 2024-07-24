import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:presence_app/app/app_reporter.dart';
import 'package:utopia_arch/utopia_arch.dart';

class NfcState extends HasInitialized {
  const NfcState({
    required super.isInitialized,
    required this.decodedMessage,
    required this.tagsStream,
    required this.history,
  });

  final String? decodedMessage;
  final IList<String> history;
  final Stream<String> tagsStream;
}

NfcState useNfcState() {
  final isNfcAvailable = useState<bool>(false);
  useEffect(() async => isNfcAvailable.value = await NfcManager.instance.isAvailable(), [NfcManager.instance]);

  final tagsStreamController = useStreamController<String>();
  final tagsStream = useMemoized(() => tagsStreamController.stream.asBroadcastStream());
  final historyState = useState<IList<String>>(IList());

  useAutoComputedState(
    () async {
      if (isNfcAvailable.value) {
        await NfcManager.instance.startSession(
          onDiscovered: (tag) async {
            final ndef = Ndef.from(tag);
            if (ndef == null) {
              appReporter.warning('Tag is not compatible with NDEF');
              return;
            } else {
              if (ndef.cachedMessage != null) {
                final message = await ndef.read();
                for (final record in message.records) {
                  final decodedMessage = String.fromCharCodes(record.payload);
                  historyState.value = historyState.value.add(decodedMessage);
                  tagsStreamController.add(decodedMessage);
                }
              }
            }
          },
        );
      }
    },
    keys: [isNfcAvailable.value],
  );

  return NfcState(
    isInitialized: true,
    decodedMessage: "xdd",
    history: historyState.value,
    tagsStream: tagsStream,
  );
}
