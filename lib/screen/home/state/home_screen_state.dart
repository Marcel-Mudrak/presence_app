import 'package:utopia_arch/utopia_arch.dart';

class HomeScreenState {
  const HomeScreenState({
    required this.counterValue,
  });

  final int counterValue;
}

HomeScreenState useHomeScreenState() {
  final counterValue = useState<int>(0);

  return HomeScreenState(
    counterValue: counterValue.value,
  );
}
