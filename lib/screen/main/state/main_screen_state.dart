class MainScreenState {
  const MainScreenState({
    required this.onProfilePressed,
  });

  final void Function() onProfilePressed;
}

MainScreenState useMainScreenState({required void Function() moveToProfile}) {
  return MainScreenState(
    onProfilePressed: moveToProfile,
  );
}
