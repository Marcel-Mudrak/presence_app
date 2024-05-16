import 'package:utopia_arch/utopia_arch.dart';

class HomeScreenState {
  const HomeScreenState({required this.counterValue});

  final int counterValue;
}

HomeScreenState useHomeScreenState({required void Function() moveToProfile}) {
  // TODO
  final counter = useState<int>(0);

  return HomeScreenState(
    counterValue: counter.value,
  );
}
