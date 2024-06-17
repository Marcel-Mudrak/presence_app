import 'package:utopia_arch/utopia_arch.dart';

class HomePageState {
  const HomePageState({required this.searchFieldState});

  final FieldState searchFieldState;
}

HomePageState useHomePageState() {
  final searchFieldState = useFieldState();
  useEffect(() {}, [searchFieldState.value]);

  return HomePageState(
    searchFieldState: searchFieldState,
  );
}
