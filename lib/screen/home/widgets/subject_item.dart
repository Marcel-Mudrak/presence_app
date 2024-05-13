import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/screen/home/widgets/absence_item.dart';

class SubjectItem extends StatelessWidget {
  const SubjectItem({
    required this.smallTitle,
    required this.subject,
    required this.time,
    this.isNext = false,
    this.absences,
  });

  final String smallTitle;
  final String subject;
  final String time;
  final bool isNext;
  final List<String>? absences;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          smallTitle,
          style: isNext ? AppText.smallest : AppText.smaller,
        ),
        Text(
          subject,
          style: isNext ? AppText.secondaryHeader : AppText.mainHeader,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              time,
              style: isNext ? AppText.smaller : AppText.time,
            ),
            if (!isNext && absences != null)
              ...[
                const SizedBox(
                  height: 25,
                  child: VerticalDivider(
                    color: AppColors.niceWhite,
                  ),
                ),
                AbsenceItem(absences: absences!),
              ],
          ],
        ),
      ],
    );
  }
}
