//weekly_expenses_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class WeeklyExpensesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Expenses'),
      ),
      body: WeeklyCalendar(),
    );
  }
}

class WeeklyCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    List<DateTime> daysOfWeek = List.generate(7, (index) => startOfWeek.add(Duration(days: index)));

    return GridView.count(
      crossAxisCount: 2,
      children: daysOfWeek.map((day) => DayWidget(day: day, today: now)).toList(),
    );
  }
}

class DayWidget extends StatelessWidget {
  final DateTime day;
  final DateTime today;

  const DayWidget({Key? key, required this.day, required this.today}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isToday = day.day == today.day && day.month == today.month && day.year == today.year;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: isToday ? Colors.green : Colors.transparent),
      ),
      child: Center(child: Text(DateFormat('EEEE, MMMM d').format(day))),
    );
  }
}



