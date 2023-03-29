import 'package:candy/stores/store.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriorityItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Map<String, String> matchTitle = {
    '맛': 'flavor',
    '향': 'aroma',
    '식감': 'mouthfeel',
    '색감': 'appearance',
  };

  PriorityItem({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final PriorityOrderController priorityOrderController =
        Get.find(tag: 'priority');
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final tappedPriority = matchTitle[title];
          priorityOrderController.changeOrder(tappedPriority);
          print(priorityOrderController.priorityOrder);
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
                            image: NetworkImage(imageUrl),
                            opacity: priorityOrderController.priorityOrder
                                    .contains(matchTitle[title])
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
                            .contains(matchTitle[title])) {
                          return Container(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              '${priorityOrderController.priorityOrder.indexOf(matchTitle[title]) + 1}',
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
              title,
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
