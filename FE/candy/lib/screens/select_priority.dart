import 'package:candy/stores/store.dart';
import 'package:candy/widgets/select_priority/priority_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPriority extends StatefulWidget {
  const SelectPriority({super.key});

  @override
  State<SelectPriority> createState() => _SelectPriorityState();
}

class _SelectPriorityState extends State<SelectPriority> {
  @override
  Widget build(BuildContext context) {
    PriorityOrderController priorityOrderController =
        Get.put(PriorityOrderController(), tag: 'priority');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '선호 우선 순위 선택',
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '등록',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: const PriorityList(),
    );
  }
}
