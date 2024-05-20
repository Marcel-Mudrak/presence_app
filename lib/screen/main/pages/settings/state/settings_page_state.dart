import 'package:utopia_arch/utopia_arch.dart';

class SettingsPageState {
  const SettingsPageState({required this.counterValue});

  final int counterValue;
}

SettingsPageState useSettingsPageState() {
  // TODO
  final counter = useState<int>(0);

  return SettingsPageState(
    counterValue: counter.value,
  );
}
