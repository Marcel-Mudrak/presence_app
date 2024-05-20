import 'package:utopia_arch/utopia_arch.dart';

class HomePageState {
  const HomePageState({required this.counterValue});

  final int counterValue;
}

HomePageState useHomePageState() {
  // TODO
  final counter = useState<int>(0);

  return HomePageState(
    counterValue: counter.value,
  );
}
