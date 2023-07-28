import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:spot_ev/Screens/Station/home/ManageEv/StationDetailsPage.dart';
import 'package:spot_ev/Screens/User/navBar/stations/stationDetailPage.dart';
import 'package:spot_ev/Screens/connect.dart';


class StationList1 extends StatefulWidget {
  const StationList1({super.key});

  @override
  State<StationList1> createState() => _StationList1State();
}

class _StationList1State extends State<StationList1> {

   Future<dynamic> getData() async {
    var res = await get(Uri.parse('${con.url}/StationList.php'));
    print(res.body);
    var response = jsonDecode(res.body);
    return response;
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        title: Text('StationList'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context,snap) {
          if(snap.hasData){
             return ListView.builder(
            itemCount: snap.data.length,
            itemBuilder:(context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StationDetailsPage1(id:snap.data[index]['station_id']);
                  },));
                },
                child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(snap.data[index]['name']),
                    subtitle: Text(snap.data[index]['location']),
                    trailing: Image.asset('Images/Ev.png'),
                  ),
                ),
                          ),
              );
            }, 
    
          );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
         
        }
      ),
    );
  }
}