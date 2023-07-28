import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:spot_ev/Screens/User/navBar/stations/stationDetailPage.dart';
import 'package:spot_ev/Screens/connect.dart';


class StationList extends StatefulWidget {
  const StationList({super.key});

  @override
  State<StationList> createState() => _StationListState();
}

class _StationListState extends State<StationList> {

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
        title: Text('StationList'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context,snap) {
          if(snap.hasData){
             return ListView.builder(
            itemCount: 6,
            itemBuilder:(context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return StationDetailsPage(id:snap.data[index]['station_id']);
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