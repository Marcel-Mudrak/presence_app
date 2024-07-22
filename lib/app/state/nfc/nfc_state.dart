import 'package:nfc_manager/nfc_manager.dart';
import 'package:presence_app/app/app_reporter.dart';
import 'package:utopia_arch/utopia_arch.dart';

class NfcState extends HasInitialized {
  const NfcState({required super.isInitialized});
}

NfcState useNfcState() {
  final isNfcAvailable = useState<bool>(false);
  useEffect(() async => isNfcAvailable.value = await NfcManager.instance.isAvailable(), [NfcManager.instance]);

  final state = useAutoComputedState(() async {
    if (isNfcAvailable.value) {
      await NfcManager.instance.startSession(
        onDiscovered: (tag) async {
          final Ndef? ndef = Ndef.from(tag);

          if (ndef == null) {
            appReporter.warning('Tag is not compatible with NDEF');
            return;
          } else {
            final msg = await ndef.read();
            for (final it in msg.records) {
              final decodedMessage = String.fromCharCodes(it.payload);
              appReporter.info(decodedMessage);
            }
          }
        },
      );
    }
  }, keys: [isNfcAvailable.value]);

  return const NfcState(isInitialized: true);
}
