import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/User/navBar/home/cur_location.dart';
import 'package:spot_ev/Screens/User/navBar/offeruser_view.dart';
import 'package:spot_ev/Screens/User/navBar/stations/stationlist.dart';

import '../profile/profile.dart';
import 'home/homePage.dart';
import 'offerPage.dart';
class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int current_index=0;

List _items=[
  CurrentLocationScreen(),
  StationList(),
  OfferPageuser(),
  ProfilePage(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: _items[current_index],
      bottomNavigationBar:BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(color: Colors.black),
        selectedItemColor: Color.fromARGB(255, 101, 3, 153),
        selectedLabelStyle: TextStyle(color: Color.fromARGB(255, 101, 3, 153),),

        currentIndex: current_index,
        onTap: (index){
      setState(() {
        current_index=index;
      });

        },

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,),
          label: 'Home'),

          BottomNavigationBarItem(icon: Icon(Icons.charging_station),
          label: 'Station'),

          BottomNavigationBarItem(icon: Icon(Icons.local_offer_outlined),
          label: 'Offers'),

          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),
          label: 'Profile')

      ],

      ),
    );
  }
}
