import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/Station/home/complaints.dart';
import 'package:spot_ev/Screens/User/popupmenu/community.dart';
import 'package:spot_ev/Screens/User/profile/complaintss.dart';
import 'package:spot_ev/Screens/UserORStationPage.dart';
import 'package:spot_ev/Screens/connect.dart';

import '../../../login.dart';
import '../../Station/home/MyStation/Slots/Stationlots.dart';
import '../../styles/textstyle.dart';
import '../Booking/Bookingtabbar.dart';
import '../BrandView/ManageVehicle.dart';
import '../Trips/tripPage.dart';
import '../faviourites/favouritePage.dart';
import '../history/chargingHistory.dart';
import '../popupmenu/complaints.dart';
import '../wallet/walletPage.dart';
import 'complaints.dart';
import 'editprofile.dart';


class ProfilePage extends StatefulWidget {
   ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<String?> getLoginId() async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    String? LoginID=pref.getString('LoginID');
    return LoginID;
  }
  var uid ;
  var flag = 0;
  Future<void> refresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {

    });
  }
  Future<dynamic> RecieveData() async {
    uid= await getLoginId();
    var data = {'login_id': uid};
    var response = await post(Uri.parse('${con.url}/UserProfileRead.php'),body: data);
    if(uid!=null)
    print('uid: $uid');
    else{
      print('uid value not found');
    }
    print(response.body);

    if (jsonDecode(response.body)[0]['result'] == 'Success') {
      flag = 1;
      print(response.body);
    }
    else {
      flag = 0;
      print(response.body);
    }
    return jsonDecode(response.body);
  }
  @override
  void initState(){
    super.initState();
    setState(() {
      getLoginId();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 30,
      ),
  //     endDrawer: Drawer(
  // backgroundColor: Colors.white,
  //       child: Column(
  //         children: [
  //           SizedBox(height: 50,),
  //           Container(
  //               height: 60,
  //               width: double.infinity,
  //               child: OutlinedButton(onPressed: (){
  //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>complaintPage()));
  //               }, child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Icon(Icons.note_add_outlined,color: Colors.black,),
  //                  // SizedBox(width: 20,),
  //                   Text('Complaint',style: TextStyle(color: Colors.black,fontSize: 18),),
  //                   Icon(Icons.navigate_next,color: Colors.black,),
  //                 ],
  //               ))),
  //           SizedBox(height: 10,),
  //           Container(
  //               height: 60,
  //               width: double.infinity,
  //               child: OutlinedButton(onPressed: (){
  //                 Navigator.push(context, MaterialPageRoute(builder: (context)=>communityPage()));

  //               }, child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Icon(Icons.sync,color: Colors.black,),
  //                  // SizedBox(width: 20,),
  //                   Text('Community',style: TextStyle(color: Colors.black,fontSize: 18),),
  //                   Icon(Icons.navigate_next,color: Colors.black,),
  //                 ],
  //               ))),
  //         ],
  //       ),
  //     ),

      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: RecieveData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<dynamic> snapshot) {
                    
     
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Text('waiting for connection....'));
                    }
                    if (!snapshot.hasData || snapshot.data.length == 0) {
                      return Center(
                        child: Text('No Data Found !!'),
                      );
                    }
                    if(snapshot.hasData){
                      return flag == 1 ?
                    Container(
                      height: 150,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 101, 3, 153),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30)
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Padding(
                              padding: const EdgeInsets.all(28.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                            
                                  // Container(
                                  //   height: 85,
                                  //   width: 85,
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(42),
                                  //       gradient: LinearGradient(
                                  //           begin: Alignment.topLeft,
                                  //           end: Alignment.bottomRight,
                                  //           colors: [
                                  //             Color.fromARGB(255, 101, 3, 153),
                                  //             Color.fromARGB(255, 101, 3, 153),
                                  //           ]
                                  //       )
                                  //   ),
                                  //   child: Icon(Icons.person_add_alt, size: 40,
                                  //     color: Color.fromARGB(255, 101, 3, 153),),
                                  // ),
                                  SizedBox(height: 10,),
                             
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 14,),
                                       Text(
                                    '     ${snapshot.data[0]['name']}', style: profile,),
                                  Text('     ${snapshot.data[0]['email']}',
                                    style: profile,),
                                  Text('     ${snapshot.data[0]['mobile_no']}',
                                    style: profile,),
                                  SizedBox(height: 25,),
                                  Padding(
                                    padding: const EdgeInsets.only(left:15),
                                    child: Container(
                                      height: 30,
                                      width: 145,
                                      child: ElevatedButton(
                                          style:ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffD9D9D9),
                                          ),
                                          onPressed: () {}, child: Row(
                                        children: [
                                          Icon(Icons.edit, color: Colors.black,),
                                          SizedBox(height: 45,),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfilePage(
                                                      name:snapshot.data[0]['name'],
                                                      mob:snapshot.data[0]['mobile_no'],
                                                      mail:snapshot.data[0]['email'],
                                                      id:uid,
                                                    ),));
                                            },
                                            child: Text(
                                              ' Edit Profile', style: TextStyle(
                                                color: Colors.black
                                            ),),
                                          )
                                        ],
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //Pop up menu
                            // Icon(CupertinoIcons.line_horizontal_3,
                            //   color: Colors.white,)

                          ],
                        ),
                      ),

                    ) :
                    Center(child: CircularProgressIndicator(),);
                    }
                    else{
                      return Center(child: CircularProgressIndicator(),);
                    }

                 
                  },

                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Card(
                        elevation: 10,

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ManageVehicle(),));
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(250, 146, 27, 205)]),
                              // borderRadius: BorderRadius.circular(20),
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 30,),
                                Icon(CupertinoIcons.car,color: Color.fromARGB(255, 101, 3, 153),),
                                SizedBox(width: 40,),
                                Text('ManageEV')
                              ],

                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => BookingTabbar(),));
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(250, 146, 27, 205)]),
                              // borderRadius: BorderRadius.circular(20),
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 30,),
                                Icon(CupertinoIcons.bookmark,color: Color.fromARGB(255, 101, 3, 153)),
                                SizedBox(width: 40,),
                                Text('My Bookings')
                              ],

                            ),
                          ),
                        ),
                      ),
                       Card(
                        elevation: 10,

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return Complaintss();
                            },));
                           
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(250, 146, 27, 205)]),
                              // borderRadius: BorderRadius.circular(20),
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 30,),
                                Icon(CupertinoIcons.bookmark_fill,color: Color.fromARGB(255, 101, 3, 153)),
                                SizedBox(width: 40,),
                                Text('Complaints')
                              ],

                            ),
                          ),
                        ),
                      ),
                      // Card(
                      //   elevation: 10,

                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(context, MaterialPageRoute(
                      //           builder: (context) => ChargingHistory()));
                      //     },
                      //     child: Container(
                      //       height: 70,
                      //       width: MediaQuery
                      //           .of(context)
                      //           .size
                      //           .width,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(20),
                      //         color: Colors.white,
                      //       ),
                      //       child: Row(
                      //         children: [
                      //           SizedBox(width: 30,),
                      //           Icon(CupertinoIcons.lock),
                      //           SizedBox(width: 40,),
                      //           Text('History')
                      //         ],

                      //       ),
                      //     ),
                      //   ),
                      // ),
                    // Card(
                    //     elevation: 10,

                    //     child: GestureDetector(
                    //       onTap: () {
                    //         Navigator.push(context, MaterialPageRoute(
                    //           builder: (context) => TripPlannerPage(),));
                    //       },
                    //       child: Container(
                    //         height: 70,
                    //         width: MediaQuery
                    //             .of(context)
                    //             .size
                    //             .width,
                    //         decoration: BoxDecoration(
                    //                                 gradient: LinearGradient(
                    // colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(250, 146, 27, 205)]),
                    //           // borderRadius: BorderRadius.circular(20),
                    //           // borderRadius: BorderRadius.circular(20),
                    //           color: Colors.white,
                    //         ),
                    //         child: Row(
                    //           children: [
                    //             SizedBox(width: 30,),
                    //             Icon(CupertinoIcons.map_pin_ellipse,color: Color.fromARGB(255, 101, 3, 153)),
                    //             SizedBox(width: 40,),
                    //             Text('Trips')
                    //           ],

                    //         ),
                    //       ),
                    //     ),
                    //   ),
                      Card(
                        elevation: 10,

                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => favouritePage(),));
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(250, 146, 27, 205)]),
                              // borderRadius: BorderRadius.circular(20),
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 30,),
                                Icon(CupertinoIcons.heart,color: Color.fromARGB(255, 101, 3, 153)),
                                SizedBox(width: 40,),
                                Text('Favorites')
                              ],

                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 10,

                        child: GestureDetector(
                          onTap: () {
                            showDialog(context: context, builder: (context) {
                              return AlertDialog(
                                elevation: 100,
                                title: Text('Are you sure you want to logout ?'),
                                actions: [
                                  TextButton(onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            USerORStationPage()));
                                  }, child: Text('yes')),
                                  TextButton(onPressed: () {}, child: Text('No'))
                                ],
                              );
                            }
                            );
                          },
                          child: Container(
                            height: 70,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                    colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(250, 146, 27, 205)]),
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 30,),
                                Icon(Icons.logout,color: Color.fromARGB(255, 101, 3, 153)),
                                SizedBox(width: 40,),
                                Text('Logout')
                              ],

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

