import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerDetail extends StatelessWidget {
  const BeerDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_rounded,
              size: 24,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              color: Colors.grey,
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        '맥주 이름',
                        style: TextStyle(),
                      ),
                      Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  const Text('맥주 영어 이름'),
                  Row(
                    children: [
                      SizedBox(
                        width: 128,
                        height: 320,
                        child: Image.network(
                          'https://image.shutterstock.com/image-photo/image-260nw-2108189540.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Margin(marginType: 'width', size: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Row(
                              children: const [
                                Text('종류'),
                                Margin(marginType: 'width', size: 16),
                                Text('밀맥주'),
                              ],
                            ),
                          ),
                          const Margin(marginType: 'height', size: 8),
                          SizedBox(
                            child: Row(
                              children: [
                                const Text('원산지'),
                                const Margin(marginType: 'width', size: 16),
                                const Text('한국'),
                                const Margin(marginType: 'width', size: 16),
                                Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/09/Flag_of_South_Korea.svg/255px-Flag_of_South_Korea.svg.png',
                                  width: 20,
                                ),
                              ],
                            ),
                          ),
                          const Margin(marginType: 'height', size: 8),
                          SizedBox(
                            child: Row(
                              children: const [
                                Text('브랜드'),
                                Margin(marginType: 'width', size: 16),
                                Text('하이트진로'),
                              ],
                            ),
                          ),
                          const Margin(marginType: 'height', size: 8),
                          SizedBox(
                            child: Row(
                              children: const [
                                Text('도수'),
                                Margin(marginType: 'width', size: 16),
                                Text('4.2%'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Text('청량감'),
                            Margin(marginType: 'width', size: 16),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('바디감'),
                            Margin(marginType: 'width', size: 16),
                          ],
                        ),
                        Row(
                          children: const [
                            Text('맛'),
                            Margin(marginType: 'width', size: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
