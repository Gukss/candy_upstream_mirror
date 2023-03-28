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
    DateTime.utc(2023, 3, 14): [Event('맥주3')],
    DateTime.utc(2023, 3, 18): [Event('맥주3')],
    DateTime.utc(2023, 3, 23): [Event('맥주3')],
    DateTime.utc(2023, 3, 13): [Event('맥주3')],
    DateTime.utc(2023, 3, 9): [Event('맥주3')],
    DateTime.utc(2023, 3, 21): [Event('맥주3')],
    DateTime.utc(2023, 3, 5): [Event('맥주3')],
    DateTime.utc(2023, 3, 8): [Event('맥주3')],
  };

  List<Event> _getEventForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: TableCalendar(
      focusedDay: focusedDay,
      locale: 'ko-KR',
      firstDay: DateTime(1901),
      lastDay: DateTime(2101),
      daysOfWeekHeight: 30,
      headerStyle: const HeaderStyle(
          headerMargin: EdgeInsets.only(left: 40, right: 40, bottom: 10),
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      calendarStyle: const CalendarStyle(
          weekendTextStyle: TextStyle(color: Colors.red),
          todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
          todayDecoration: BoxDecoration(
            color: Color(0xFFFFEB3B),
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 204, 0),
            shape: BoxShape.circle,
          )),

      // 이벤트 있을 경우
      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, day, event) {
          if (event.isNotEmpty) {
            return Container(
              width: 35,
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 255, 204, 0).withOpacity(0.5),
                  shape: BoxShape.circle),
            );
          }
          return null;
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
    ));
  }
}

class Event {
  String title;

  Event(this.title);
}
