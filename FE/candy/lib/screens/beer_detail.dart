import 'package:candy/widgets/app_bar/beer_detail_app_bar.dart';
import 'package:candy/widgets/beer/beer_extra_info.dart';
import 'package:candy/widgets/beer/beer_info.dart';
import 'package:candy/widgets/review/beer_review_list.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BeerDetail extends StatelessWidget {
  final int beerId;

  const BeerDetail({
    super.key,
    required this.beerId,
  });

  Future<Map<String, dynamic>> getBeerInfo() async {
    const String basicUrl = 'j8b105.p.ssafy.io/api';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    http.get(
      Uri.parse('$basicUrl/$beerId'),
    );
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BeerDetailAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: const [
                      BeerInfo(
                        beerName: {'korean': '카스 프레시', 'english': 'Cass Fresh'},
                        beerImgSrc:
                            'https://justliquor.com.au/2735/cass-fresh-beer-can-355ml.jpg',
                        country: '한국',
                        brandName: '하이트진로',
                        alcoholLevel: 4.2,
                        beerType: '밀맥주',
                        rate: 3.5,
                      ),
                      Margin(marginType: MarginType.height, size: 16),
                      BeerExtraInfo(
                        bodyNum: 1,
                        tasteNum: 1,
                        freshNum: 1,
                        readOnly: true,
                      ),
                    ],
                  ),
                ),
              ),
              const Margin(marginType: MarginType.height, size: 32),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  BeerReviewList(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
