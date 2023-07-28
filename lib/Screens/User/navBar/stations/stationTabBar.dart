import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/User/navBar/stations/photosGridStation.dart';
import 'package:spot_ev/Screens/User/navBar/stations/reviewPage.dart';

import 'overViewPage.dart';
class StationTabPage extends StatelessWidget {
  const StationTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 3, child:
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
              OverViewPage(),
              ReviewPage(),
              PhotosGridView(),


            ]),
          )
        ],
      ),
    ));
  }
}
