import 'package:flutter/material.dart';
import 'package:presence_app/screen/main/pages/home/state/home_page_state.dart';
import 'package:presence_app/screen/main/pages/home/widgets/home_absence_bottom_modal.dart';

class AbsenceButton extends StatelessWidget {
  const AbsenceButton({
    super.key,
    required this.buttonCaption,
    required this.caption,
    required this.icon,
    required this.shouldRotate,
    required this.state,
  });

  final String buttonCaption;
  final String caption;
  final IconData? icon;
  final bool shouldRotate;
  final HomePageState state;

  @override
  Widget build(BuildContext context) {
    return HomeAbsenceBottomModal(
      state: state,
      buttonCaption: buttonCaption,
      shouldRotate: shouldRotate,
      icon: icon,
    );
  }
}
