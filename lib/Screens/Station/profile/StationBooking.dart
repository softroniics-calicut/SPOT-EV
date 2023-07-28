import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:spot_ev/Screens/connect.dart';

class StationBookings extends StatefulWidget {
  String id;
  StationBookings({super.key, required this.id});

  @override
  State<StationBookings> createState() => _StationBookingsState();
}

class _StationBookingsState extends State<StationBookings> {
  Future<dynamic> getData() async {
    var data = {"id": widget.id};
    print(data);
    var response =
        await post(Uri.parse('${con.url}/s_booking1.php'), body: data);
        print(response.body);
    var res = response.body;
    var r = jsonDecode(res);
    print(res);
    return r;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 101, 3, 153),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snap) {
              return FutureBuilder(

                  future: getData(),
                  builder: (context, snap) {
                    if (snap.hasData) {
                      if(snap.data[0]['result']=='Success'){
                         return ListView.builder(
                          itemCount: snap.data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(snap.data[index]['name']),
                                subtitle: Text(snap.data[index]['date']),
                                trailing:  Text(snap.data[index]['time']),
                              ),
                            );
                          },
                        );
                      }
                      else{
                        return Center(child: Text('No Bookings !'),);
                      }
                    
                       
                      
                     
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  });
            }));
  }
}
