import 'package:utopia_arch/utopia_arch.dart';

class ProfilePageState {
  const ProfilePageState({
    required this.counterValue,
  });

  final int counterValue;
}

ProfilePageState useProfileScreenState() {
  // TODO
  final counterValue = useState<int>(0);

  return ProfilePageState(
    counterValue: counterValue.value,
  );
}
