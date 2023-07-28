import 'package:flutter/material.dart';

import '../../../User/navBar/stations/photosGridStation.dart';
import 'StationOverViewPage.dart';
import 'StationReviewsPage.dart';
class StationTabBar extends StatelessWidget {
  const StationTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(length: 3, child:
      Scaffold(
      body: Column(
        children: [
          TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(
                text:'OVERVIEW',
              ),
              Tab(
                text:'REVIEWS',
              ),   Tab(
                text:'PHOTOS',
              ),
            ],),
          Expanded(
            child: TabBarView(children: [
              StationOverViewPage(),
              StationReviewPage(),
              PhotosGridView(),


            ]),
          )
        ],
      ),
    ));
  }
}
