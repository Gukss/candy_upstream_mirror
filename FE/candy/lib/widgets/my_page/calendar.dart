import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';

import 'package:candy/api/user_api_service.dart';
import 'package:candy/models/user/user_daily_data_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  final String email;

  const Calendar({
    super.key,
    required this.email,
  });

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime focusedDay = DateTime.now();

  Future<List<UserDailyDataModel>> events(String email) async {
    return await UserApiService.getUserDailyData(email: email);
  }

  drunkDay(DateTime day, List<UserDailyDataModel> allday) {
    final date = DateFormat('yyyy-MM-dd').format(day);
    for (int i = 0; i < allday.length; i++) {
      if (date == allday[i].createdAt) {
        return ['true'];
      }
    }
    return [];
  }

  final RefreshController refreshController = Get.find();

  @override
  void initState() {
    super.initState();
    refreshController.calendarRefresh = () {
      setState(() {});
    };
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.calendarRefresh = () {};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: events(widget.email),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: TableCalendar(
              focusedDay: focusedDay,
              locale: 'ko-KR',
              firstDay: DateTime(1901),
              lastDay: DateTime.now(),
              daysOfWeekHeight: 30,
              headerStyle: const HeaderStyle(
                  headerMargin: EdgeInsets.only(left: 40, right: 40, bottom: 0),
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              calendarStyle: const CalendarStyle(
                weekendTextStyle: TextStyle(color: Colors.red),
                todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                todayDecoration: BoxDecoration(
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
          );
        }
        return const SizedBox();
      },
    );
  }
}
