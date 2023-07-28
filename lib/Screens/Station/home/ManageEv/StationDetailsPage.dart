import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart';
import 'package:spot_ev/Screens/Station/home/ManageEv/StationRatingPage.dart';
import 'package:spot_ev/Screens/Station/home/ManageEv/StationReviewsPage.dart';
import 'package:spot_ev/Screens/Station/home/ManageEv/staionratigview.dart';
import 'package:spot_ev/Screens/User/navBar/stations/BookASection.dart';
import 'package:spot_ev/Screens/User/navBar/stations/stationRating.dart';
import 'package:spot_ev/Screens/connect.dart';
import 'package:url_launcher/url_launcher.dart';

class StationDetailsPage1 extends StatefulWidget {
  String id;
  StationDetailsPage1({super.key, required this.id});

  @override
  State<StationDetailsPage1> createState() => _StationDetailsPage1State();
}

class _StationDetailsPage1State extends State<StationDetailsPage1> {
  Future<dynamic> getData() async {
    var data = {
      "id": widget.id,
    };
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$data');

    var response =
        await post(Uri.parse('${con.url}/StationRead.php'), body: data);
        print(response.body);
    var res = jsonDecode(response.body);
    print(res);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snap) {
            if (snap.hasData) {
              return Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Lottie.asset('Images/charge.json'),
                      height: 200,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.charging_station_rounded,color: Color.fromARGB(249, 116, 15, 167),),
                              SizedBox(
                                width: 20,
                              ),
                              // Text(
                              //   'name : ',
                              //   style: TextStyle(fontSize: 17),
                              // ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        snap.data[0]['name'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on_outlined,color: Color.fromARGB(249, 116, 15, 167),),
                              SizedBox(
                                width: 20,
                              ),
                              // Text('Location : ',
                              //     style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        snap.data[0]['place'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.email,color: Color.fromARGB(249, 116, 15, 167)),
                              SizedBox(
                                width: 20,
                              ),
                              // Text('Email : ', style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        snap.data[0]['email'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.phone,color: Color.fromARGB(249, 116, 15, 167)),
                              SizedBox(
                                width: 20,
                              ),
                              // Text('Phone : ', style: TextStyle(fontSize: 17)),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        snap.data[0]['mobile_no'],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          
                         Navigator.push(context, MaterialPageRoute(builder: (context) {
                           return SatationRatingPage1(id: snap.data[0]['station_id'],);
                         },));
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'Reviews',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromARGB(249, 116, 15, 167),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                             launchUrl(Uri.parse('tel:${snap.data[0]['mobile_no']}'));
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              'call',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromARGB(249, 116, 15, 167),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
              ]);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
