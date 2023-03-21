import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class Calendar2 extends StatefulWidget {
  const Calendar2({Key? key}) : super(key: key);

  @override
  _Calendar2State createState() => _Calendar2State();
}

class _Calendar2State extends State<Calendar2> {
  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  // 이벤트가 있는 배열
  Map<DateTime, List<Event>> events = {
    DateTime.utc(2023, 3, 1): [Event('맥주1')],
    DateTime.utc(2023, 3, 14): [Event('맥주3')]
  };

  List<Event> _getEventForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: TableCalendar(
      focusedDay: focusedDay,
      firstDay: DateTime(1901),
      lastDay: DateTime(2101),
      // locale: 'ko-KR',
      daysOfWeekHeight: 30,
      headerStyle: const HeaderStyle(
          headerMargin: EdgeInsets.only(left: 40, right: 40, bottom: 10),
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      calendarStyle: const CalendarStyle(
          weekendTextStyle: TextStyle(color: Colors.red),
          holidayTextStyle: TextStyle(color: Colors.blue),
          todayTextStyle: TextStyle(fontWeight: FontWeight.bold)),

      // 이벤트 있을 경우
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, event) {
          if (event.isNotEmpty) {
            return Container(
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2), shape: BoxShape.circle),
            );
          }
        },
      ),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          this.selectedDay = selectedDay;
          this.focusedDay = focusedDay;
        });
      },
      selectedDayPredicate: (day) {
        return isSameDay(selectedDay, day);
      },
      eventLoader: _getEventForDay,
    )));
  }
}

class Event {
  String title;

  Event(this.title);
}
