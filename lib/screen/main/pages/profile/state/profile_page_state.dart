import 'package:utopia_arch/utopia_arch.dart';

class ProfileScreenState {
  const ProfileScreenState({
    required this.counterValue,
  });

  final int counterValue;
}

ProfileScreenState useProfileScreenState() {
  // TODO
  final counterValue = useState<int>(0);

  return ProfileScreenState(
    counterValue: counterValue.value,
  );
}
