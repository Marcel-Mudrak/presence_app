import 'package:utopia_arch/utopia_arch.dart';

class ProfilePageState {
  const ProfilePageState({
    required this.searchFieldState,
  });

  final FieldState searchFieldState;
}

ProfilePageState useProfilePageState() {
  final searchFieldState = useFieldState();
  useEffect(() {}, [searchFieldState.value]);

  return ProfilePageState(
    searchFieldState: searchFieldState,
  );
}
