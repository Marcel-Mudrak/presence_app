import 'package:nfc_manager/nfc_manager.dart';
import 'package:presence_app/app/app_reporter.dart';
import 'package:utopia_arch/utopia_arch.dart';

class NfcState extends HasInitialized {
  const NfcState({
    required super.isInitialized,
    required this.decodedMessage,
  });

  final String? decodedMessage;
}

NfcState useNfcState() {
  final isNfcAvailable = useState<bool>(false);
  useEffect(() async => isNfcAvailable.value = await NfcManager.instance.isAvailable(), [NfcManager.instance]);

  final nfcTag = useState<String?>(null);

  final state = useAutoComputedState(
    () async {
      if (isNfcAvailable.value) {
        await NfcManager.instance.startSession(
          onDiscovered: (tag) async {
            final Ndef? ndef = Ndef.from(tag);

            if (ndef == null) {
              appReporter.warning('Tag is not compatible with NDEF');
              return;
            } else {
              if (ndef.cachedMessage != null) {
                final message = await ndef.read();
                for (final record in message.records) {
                  final decodedMessage = String.fromCharCodes(record.payload);
                  // appReporter.info(decodedMessage);
                  // nfcTag.value = decodedMessage;
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

  useStreamSubscription(
    tagsStream,
    (e) {
      appReporter.info("Tag: $e");
    },
  );

  return NfcState(
    isInitialized: true,
    decodedMessage: "xdd",
    tagsStream: tagsStream,
  );
}
