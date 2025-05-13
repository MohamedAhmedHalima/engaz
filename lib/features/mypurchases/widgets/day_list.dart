import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MonthDaysList extends StatefulWidget {
  const MonthDaysList({super.key});

  @override
  _MonthDaysListState createState() => _MonthDaysListState();
}

class _MonthDaysListState extends State<MonthDaysList> {
  late ScrollController _scrollController;
  int _selectedDayIndex = DateTime.now().day - 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final itemWidth = 80.0;
      final listViewWidth = MediaQuery.of(context).size.width;
      final targetScrollPosition = (_selectedDayIndex * itemWidth) -
          (listViewWidth / 2) +
          (itemWidth / 2);

      _scrollController.jumpTo(targetScrollPosition.clamp(
          0.0, _scrollController.position.maxScrollExtent));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final currentMonthStart = DateTime(today.year, today.month, 1);
    final selectedDate =
        currentMonthStart.add(Duration(days: _selectedDayIndex));
    final selectedDateFormatted =
        DateFormat('EEEE, d MMMM yyyy', 'ar').format(selectedDate);

    return Column(
      children: [
        // Display the selected date above the list
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            selectedDateFormatted,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF13A9CA),
            ),
          ),
        ),
        SizedBox(
          height: 80.h,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = constraints.maxWidth / 7;

              return ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: DateTime(today.year, today.month + 1, 0).day,
                itemBuilder: (context, index) {
                  final date = currentMonthStart.add(Duration(days: index));
                  final day = DateFormat('E', 'ar').format(date);
                  final dayNumber = DateFormat('d').format(date);

                  final isSelected = index == _selectedDayIndex;
                  final isToday =
                      date.day == today.day && date.month == today.month;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDayIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AnimatedScale(
                        duration: const Duration(milliseconds: 300),
                        scale: isSelected ? 1.2 : 1.0,
                        curve: Curves.easeInOut,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          width: itemWidth,
                          height: 79,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFE6F4F7)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.transparent
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 200),
                                style: TextStyle(
                                  color: isToday
                                      ? Colors.green
                                      : (isSelected
                                          ? const Color(0xFF13A9CA)
                                          : const Color(0xFF121212)),
                                  fontSize: isSelected ? 20.0 : 18.0,
                                  fontWeight: isSelected
                                      ? FontWeight.w700
                                      : FontWeight.w400,
                                ),
                                child: Text(
                                  dayNumber,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 2),
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 200),
                                style: TextStyle(
                                  color: isToday
                                      ? Colors.green
                                      : (isSelected
                                          ? const Color(0xFF13A9CA)
                                          : const Color(0xFF797979)),
                                  fontSize: isSelected ? 14.0 : 12.0,
                                  fontWeight: isSelected
                                      ? FontWeight.w500
                                      : FontWeight.w400,
                                ),
                                child: Text(
                                  day,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
