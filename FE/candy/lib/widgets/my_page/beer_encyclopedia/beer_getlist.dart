import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';

import 'package:candy/api/beer_api_service.dart';
import 'package:candy/models/beer/all_beer_list_model.dart';
import 'package:candy/widgets/my_page/beer_encyclopedia/beer_encyclopedia.dart';
import 'package:get/get.dart';

class BeerGetList extends StatelessWidget {
  BeerGetList({super.key});

  final UserController userController = Get.find();

  Future<List<AllBeerListModel>> beerlist() async {
    return await BeerApiService.getAllBeerList(
        email: userController.userEmail.value);
  }

  checkpercent(List<AllBeerListModel> allbeer) {
    final drunkbeer = allbeer.where((e) => e.isDrunk > 0).toList();
    return drunkbeer.length / allbeer.length;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: beerlist(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BeerEncyclopedia(
              beerlist: snapshot.data!,
              beerpercent: checkpercent(snapshot.data!),
            );
          }
          return const SizedBox();
        });
  }
}
