
import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/UserORStationPage.dart';


import 'Screens/User/navBar/stations/map.dart';

void main(){
 runApp (MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home:USerORStationPage()

    );
  }
}
