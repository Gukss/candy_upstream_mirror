import 'package:candy/stores/store.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriorityItem extends StatelessWidget {
  final Map<String, String> priorityItem;

  const PriorityItem({
    super.key,
    required this.priorityItem,
  });

  @override
  Widget build(BuildContext context) {
    final PriorityOrderController priorityOrderController =
        Get.find(tag: 'priority');
    return Expanded(
      child: GestureDetector(
        onTap: () {
          priorityOrderController.changeOrder(priorityItem['titleValue']);
        },
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Obx(
                      () => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(priorityItem['imgUrl']!),
                            opacity: priorityOrderController.priorityOrder
                                    .contains(priorityItem['titleValue'])
                                ? 0.5
                                : 1,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Obx(
                      () {
                        if (priorityOrderController.priorityOrder
                            .contains(priorityItem['titleValue'])) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              '${priorityOrderController.priorityOrder.indexOf(priorityItem['titleValue']) + 1}',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Margin(marginType: MarginType.height, size: 16),
            Text(
              priorityItem['titleLabel']!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Margin(marginType: MarginType.height, size: 16),
          ],
        ),
      ),
    );
  }
}
