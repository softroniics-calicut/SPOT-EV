import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/connect.dart';

class CancelledBookings extends StatefulWidget {
  const CancelledBookings({super.key});

  @override
  State<CancelledBookings> createState() => _CancelledBookingsState();
}

class _CancelledBookingsState extends State<CancelledBookings> {

    Future<dynamic> getData() async {
        SharedPreferences pref = await SharedPreferences.getInstance();
    var sp = pref.getString('LoginID');
    var data={
      "id": sp
    };
    var response = await post(Uri.parse('${con.url}/bookingscancel.php'),body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if(snapshot.data[0]['result']=='Success'){
                 return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color:  Color.fromARGB(34, 101, 3, 153),),
                      height: 280,
                      width: double.infinity,
                    
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text('  Date : '),
                                              Text('${snapshot.data[index]['date']}',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Text(' Time : '),
                                              Text('${snapshot.data[index]['time']}',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(child: Text('Cancelled',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 10, left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.home),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      snapshot.data[index]['name'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      snapshot.data[index]['location'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, left: 20, right: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      snapshot.data[index]['mobile_no'],
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text('Rs. 100/-',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
              }
              else{
                return Center(
                  child: Text('No Cancelled bookings!'),
                );
              }
             
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    ));
  }
}