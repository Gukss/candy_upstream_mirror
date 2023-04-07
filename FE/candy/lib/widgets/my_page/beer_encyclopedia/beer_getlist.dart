import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';

import 'package:candy/api/beer_api_service.dart';
import 'package:candy/models/beer/all_beer_list_model.dart';
import 'package:candy/widgets/my_page/beer_encyclopedia/beer_encyclopedia.dart';
import 'package:get/get.dart';

class BeerGetList extends StatefulWidget {
  final String email;

  const BeerGetList({
    super.key,
    required this.email,
  });

  @override
  State<BeerGetList> createState() => _BeerGetListState();
}

class _BeerGetListState extends State<BeerGetList> {
  Future<List<AllBeerListModel>> beerlist() async {
    return await BeerApiService.getAllBeerList(email: widget.email);
  }

  checkpercent(List<AllBeerListModel> allbeer) {
    final drunkbeer = allbeer.where((e) => e.isDrunk > 0).toList();
    return drunkbeer.length / allbeer.length;
  }

  final RefreshController refreshController = Get.find();

  @override
  void initState() {
    super.initState();
    refreshController.beerListRefresh = () {
      setState(() {});
    };
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.beerListRefresh = () {};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: beerlist(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BeerEncyclopedia(
              email: widget.email,
              beerlist: snapshot.data!,
              beerpercent: checkpercent(snapshot.data!),
            );
          }
          return const SizedBox();
        });
  }
}
