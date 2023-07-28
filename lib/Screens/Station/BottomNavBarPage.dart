import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/Station/home/ManageEv/StationListandAddStation.dart';
import 'package:spot_ev/Screens/Station/profile/StationProfile.dart';
import 'package:spot_ev/Screens/UserORStationPage.dart';

import 'home/HomePage.dart';

class StationBottomNavBArPage extends StatefulWidget {
  StationBottomNavBArPage({Key? key}) : super(key: key);

  @override
  State<StationBottomNavBArPage> createState() =>
      _StationBottomNavBArPageState();
}

class _StationBottomNavBArPageState extends State<StationBottomNavBArPage> {
  int current_index = 1;
  Future LogoutDialog(){
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text('Are you sure you want to logout?'),
      actions: [
        TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>USerORStationPage()));
        }, child: Text('Yes')),
        TextButton(onPressed: (){
          Navigator.pop(context);
    }, child: Text('No')),
      ],
    );
  });
  }
  List items = [StationList1(), StationProfile(),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[current_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: current_index,
        onTap: (index){
          setState(() {
            current_index=index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled,),
          label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person),
          label: 'Profile'),
          BottomNavigationBarItem(icon: IconButton(onPressed: () {
            LogoutDialog();
          }, icon: Icon(Icons.logout),),
          label: 'Logout')
        ],
      ),
    );
  }
}
