import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_text.dart';

class AbsenceItem extends StatelessWidget {
  const AbsenceItem({
    super.key,
    required this.absences,
  });

  final List<String> absences;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Unexcused absences: ',
                style: AppText.smallest,
              ),
              TextSpan(
                text: absences[0],
                style: AppText.smallest.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Total: ',
                style: AppText.smallest,
              ),
              TextSpan(
                text: absences[1],
                style: AppText.smallest.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
