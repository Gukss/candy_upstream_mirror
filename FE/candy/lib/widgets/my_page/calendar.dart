import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';

import 'package:candy/api/user_api_service.dart';
import 'package:candy/models/user/user_daily_data_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime focusedDay = DateTime.now();

  UserController userController = Get.find();

  Future<List<UserDailyDataModel>> events() async {
    return await UserApiService.getUserDailyData(
        year: focusedDay.year,
        month: focusedDay.month,
        email: userController.userEmail.value);
  }

  drunkDay(DateTime day, List<UserDailyDataModel> allday) {
    final date = DateFormat('yyyy-MM-d').format(day);
    for (int i = 0; i < allday.length; i++) {
      if (date == allday[i].createdAt) {
        return ['true'];
      }
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: events(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SafeArea(
              child: SingleChildScrollView(
            child: TableCalendar(
              focusedDay: focusedDay,
              locale: 'ko-KR',
              firstDay: DateTime(1901),
              lastDay: DateTime.now(),
              daysOfWeekHeight: 30,
              headerStyle: const HeaderStyle(
                  headerMargin:
                      EdgeInsets.only(left: 40, right: 40, bottom: 10),
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              calendarStyle: const CalendarStyle(
                weekendTextStyle: TextStyle(color: Colors.red),
                todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                todayDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 205, 6),
                  shape: BoxShape.circle,
                ),
              ),

              // 이벤트 있을 경우
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, day, event) {
                  if (event.isNotEmpty) {
                    return Container(
                      width: 35,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 196, 0)
                              .withOpacity(0.4),
                          shape: BoxShape.circle),
                    );
                  }
                  return null;
                },
              ),
              eventLoader: (day) {
                return drunkDay(day, snapshot.data!);
              },
            ),
          ));
        }
        return const SizedBox();
      },
    );
  }
}
