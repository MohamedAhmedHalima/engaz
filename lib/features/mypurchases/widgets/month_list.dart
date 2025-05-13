import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthList extends StatefulWidget {
  const MonthList({super.key});

  @override
  _MonthListState createState() => _MonthListState();
}

class _MonthListState extends State<MonthList> {
  late ScrollController _scrollController;
  int _selectedMonthIndex = DateTime.now().month - 1;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final itemWidth = 100.0;
      final listViewWidth = MediaQuery.of(context).size.width;
      final targetScrollPosition = (_selectedMonthIndex * itemWidth) -
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

    return Column(
      children: [
        // Selected Month Display
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            DateFormat('MMMM', 'ar')
                .format(DateTime(today.year, _selectedMonthIndex + 1, 1)),
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF13A9CA),
            ),
          ),
        ),

        // Horizontal List of Months
        SizedBox(
          height: 80,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = constraints.maxWidth / 7;

              return ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 12,
                itemBuilder: (context, index) {
                  final date = DateTime(today.year, index + 1, 1);
                  final monthName = DateFormat('MMM', 'ar').format(date);

                  bool isSelected = index == _selectedMonthIndex;
                  bool isCurrentMonth = date.month == today.month;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedMonthIndex = index;
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
                          child: Center(
                            child: AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 200),
                              style: TextStyle(
                                color: isCurrentMonth
                                    ? Colors.green
                                    : (isSelected
                                        ? const Color(0xFF13A9CA)
                                        : const Color(0xFF797979)),
                                fontSize: isSelected ? 18.0 : 16.0,
                                fontWeight: isSelected
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                              ),
                              child: FittedBox(
                                child: Text(
                                  monthName,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
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
