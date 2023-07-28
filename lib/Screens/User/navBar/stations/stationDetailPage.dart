import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/Station/home/ManageEv/StationReviewsPage.dart';
import 'package:spot_ev/Screens/Station/home/MyStation/Slots/Stationlots.dart';
import 'package:spot_ev/Screens/Station/profile/StationReviews.dart';
import 'package:spot_ev/Screens/User/navBar/stations/BookASection.dart';
import 'package:spot_ev/Screens/User/navBar/stations/stationRating.dart';
import 'package:spot_ev/Screens/connect.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../profile/complaints.dart';

class StationDetailsPage extends StatefulWidget {
  String id;
  StationDetailsPage({super.key, required this.id});

  @override
  State<StationDetailsPage> createState() => _StationDetailsPageState();
}

class _StationDetailsPageState extends State<StationDetailsPage> {
  Future<dynamic> getData() async {
    var data = {
      "id": widget.id,
    };
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$data');

    var response =
        await post(Uri.parse('${con.url}/Stationview.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    print(res);

    return res;
  }

  postData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var sp = pref.getString('LoginID');
    var data = {"id": sp, "station_id": widget.id};
    print(data);
    var response = await post(Uri.parse('${con.url}/add-fav.php'), body: data);
    var res = jsonDecode(response.body);
    print(res);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added to Favorites'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder(
            future: getData(),
            builder: (context, snap) {
              if (snap.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        postData();
                      },
                      child: Container(
                        height: 40,
                        width: 150,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('  Add to Favourite '),
                            Icon(
                              CupertinoIcons.heart_fill,
                              color: Colors.red,
                            )
                          ],
                          
                        )),
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(50),
                        //     color: Color.fromARGB(255, 138, 218, 227)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 255, 255, 255),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(211, 181, 96, 196),
                              blurRadius: 10.0,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ),
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
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              launchUrl(
                                Uri.parse('tel:${snap.data[0]['mobile_no']}'),
                              );
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  'Call',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 94, 1, 89), fontSize: 15),
                                ),
                              ),
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                 boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(90, 0, 0, 0),
                              blurRadius: 10.0,
                              offset: Offset(6.0, 6.0),
                            ),
                          ],
                                  gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 246, 242, 246), Colors.white]),
                                borderRadius: BorderRadius.circular(50),
                                 color: Colors.blue,
                              ),
                            ),
                          ),
                          InkWell(
                             onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BookASection(id: snap.data[0]['station_id']);
                          },
                        ));
                      },
                            child: Container(
                              child: Center(
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 84, 1, 80), fontSize: 15),
                                ),
                              ),
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                 boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(90, 0, 0, 0),
                              blurRadius: 10.0,
                              offset: Offset(6.0, 6.0),
                            ),
                          ],
                                gradient: LinearGradient(
                      colors: [Color.fromARGB(255, 246, 242, 246), Colors.white]),
                                borderRadius: BorderRadius.circular(50),
                                // color: Colors.blue,
                              ),
                            ),
                          ),
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
                                  Icon(Icons.charging_station_rounded,color:Color.fromARGB(255, 112, 3, 96)),
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
                                  Icon(Icons.location_on_outlined,color:Color.fromARGB(255, 112, 3, 96)),
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
                                  Icon(Icons.email,color:Color.fromARGB(255, 112, 3, 96)),
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
                                  Icon(Icons.phone,color:Color.fromARGB(255, 112, 3, 96)),
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
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Available Fecilities',
                        style: TextStyle(
                           color: Color.fromARGB(255, 72, 1, 61),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.coffee,color:Color.fromARGB(255, 112, 3, 96)),
                              Text("Cafe"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.family_restroom,color:Color.fromARGB(255, 112, 3, 96)),
                              Text("Rest Room"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Icon(Icons.shopping_bag_rounded,color:Color.fromARGB(255, 112, 3, 96)),
                              Text("Store"),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return StationReviews(
                                    id: snap.data[0]['station_id'],
                                  );
                                },
                              ));
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  'Reviews',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 94, 1, 89), fontSize: 15),
                                ),
                              ),
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                 boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(90, 0, 0, 0),
                              blurRadius: 10.0,
                              offset: Offset(6.0, 6.0),
                            ),
                          ],
                                  gradient: LinearGradient(
                      colors: [Color.fromARGB(210, 173, 48, 196), Color.fromARGB(255, 248, 232, 241)]),
                                borderRadius: BorderRadius.circular(50),
                                 color: Colors.blue,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Complaints(id: snap.data[0]['station_id']),
                                ));
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  'Complaints',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 84, 1, 80), fontSize: 15),
                                ),
                              ),
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                 boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(90, 0, 0, 0),
                              blurRadius: 10.0,
                              offset: Offset(6.0, 6.0),
                            ),
                          ],
                                gradient: LinearGradient(
                      colors: [Color.fromARGB(210, 173, 48, 196), Color.fromARGB(255, 248, 232, 241)]),
                                borderRadius: BorderRadius.circular(50),
                                // color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(context, MaterialPageRoute(
                    //       builder: (context) {
                    //         return BookASection(id: snap.data[0]['station_id']);
                    //       },
                    //     ));
                    //   },
                    //   child: Container(
                    //     child: Center(
                    //         child: Text(
                    //       'Book Now',
                    //       style: TextStyle(
                    //           fontSize: 16,
                    //           color: Color.fromARGB(255, 72, 1, 61)),
                    //     )),
                    //     height: 50,
                    //     width: 200,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(50),
                    //       color: Color.fromARGB(210, 203, 79, 225),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Color.fromARGB(90, 0, 0, 0),
                    //           blurRadius: 10.0,
                    //           offset: Offset(6.0, 6.0),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),


                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: InkWell(
                    //       onTap: () {
                    //         Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) =>
                    //                   Complaints(id: snap.data[0]['station_id']),
                    //             ));
                    //       },
                    //       child: Text('add complaint')),
                    // )
                  ]),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
