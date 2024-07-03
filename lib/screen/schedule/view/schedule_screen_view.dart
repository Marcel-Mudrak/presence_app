import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/common/widget/custom_app_bar.dart';
import 'package:presence_app/common/widget/field/text/app_text_field.dart';
import 'package:presence_app/models/subject/subject.dart';
import 'package:presence_app/screen/schedule/state/schedule_screen_state.dart';
import 'package:presence_app/util/extension/date_extensions.dart';
import 'package:presence_app/util/extension/string_extensions.dart';
import 'package:search_highlight_text/search_highlight_text.dart';
import 'package:utopia_arch/utopia_arch.dart';

class ScheduleScreenView extends StatelessWidget {
  const ScheduleScreenView({
    super.key,
    required this.state,
  });

  final ScheduleScreenState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 16,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.gradientSecondary,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(backIcon: true),
              const SizedBox(height: 24),
              const Text(
                'Schedule',
                style: AppText.secondaryHeader,
              ),
              const SizedBox(height: 4),
              const Text(
                'ZIIAS1-3611',
                style: AppText.small,
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () async {
                  state.chosenDateRangeState.value = await showRangePickerDialog(
                    context: context,
                    minDate: DateTime.now().subtract(const Duration(days: 90)),
                    maxDate: DateTime.now().add(const Duration(days: 90)),
                  );
                },
                child: _buildScheduleDateRangeButton(
                  text: 'Select date range',
                ),
              ),
              _buildSearchField(context),
              const SizedBox(height: 12),
              _buildScheduleDate(
                text:
                    'Showing ${state.chosenDateRangeState.value?.start.toDisplayString()} to ${state.chosenDateRangeState.value?.end.toDisplayString()}',
              ),
              const SizedBox(height: 12),
              Expanded(
                child: _buildCustomScrollView(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomScrollView() {
    return CustomScrollView(
      slivers: [
        for (final period in state.subjectsWithPeriodList) ...[
          SliverList.builder(
            itemCount: period.subjects.where((it) {
              final isInDateRange = it.date.isAfter(state.chosenDateRangeState.value!.start) &&
                  it.date.isBefore(state.chosenDateRangeState.value!.end);

              if (state.searchFieldState.value.isEmpty) {
                return isInDateRange;
              }

              final isInSearchQuery = it.courseName.toLowerCase().contains(state.searchFieldState.value.toLowerCase());

              return isInDateRange && isInSearchQuery;
            }).length,
            itemBuilder: (context, index) {
              final sortedSubjects = period.subjects.toSortedList((a, b) => b.date.compareTo(a.date));

              return _buildSubjectItem(
                index: index,
                subjects: sortedSubjects.where((it) {
                  final isInDateRange = it.date.isAfter(state.chosenDateRangeState.value!.start) &&
                      it.date.isBefore(state.chosenDateRangeState.value!.end);

                  if (state.searchFieldState.value.isEmpty) {
                    return isInDateRange;
                  }

                  final isInSearchQuery =
                      it.courseName.toLowerCase().contains(state.searchFieldState.value.toLowerCase());

                  return isInDateRange && isInSearchQuery;
                }).toList(),
              );
            },
          ),
        ],
      ],
    );
  }

  Widget _buildScheduleDateRangeButton({required String text}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.button.withAlpha(128),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: AppText.smallerHeader,
      ),
    );
  }

  Widget _buildScheduleDate({required String text}) {
    return Text(
      text,
      style: AppText.smallHeader.copyWith(fontWeight: FontWeight.w300, letterSpacing: -1),
    );
  }

  AppTextField _buildSearchField(BuildContext context) {
    return AppTextField(
      state: state.searchFieldState,
      prefix: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(
          Icons.search,
          color: AppColors.niceWhite.withAlpha(128),
        ),
      ),
      hint: const Text('Search'),
    );
  }

  Widget _buildSubjectItem({
    required int index,
    required List<Subject> subjects,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subjects[index].date.toDisplayString(),
          style: AppText.date,
        ),
        const SizedBox(height: 2),
        SearchTextInheritedWidget(
          highlightColor: AppColors.flatOrange,
          searchText: state.searchFieldState.value,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.elasticOut,
            style: state.searchFieldState.value.isNotEmpty
                ? AppText.smallHeader.copyWith(fontSize: 28)
                : AppText.smallHeader,
            child: SearchHighlightText(
              subjects[index].courseName,
            ),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          subjects[index].courseType.capitalize(),
          style: AppText.smallerHeader,
        ),
        Text(
          subjects[index].day,
          style: AppText.smaller,
        )
      ],
    );
  }
}
