import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:spot_ev/Screens/connect.dart';
import 'package:spot_ev/Screens/styles/textstyle.dart';

import '../../LOCATION.dart';

class EditProfileDetailPage extends StatefulWidget {
  EditProfileDetailPage(
      {Key? key, required this.name, required this.mob, required this.mail,required this.id})
      : super(key: key);
  var name, mob, mail,id;

  @override
  State<EditProfileDetailPage> createState() => _EditProfileDetailPageState();
}

class _EditProfileDetailPageState extends State<EditProfileDetailPage> {

  var thisName = TextEditingController();

  var thisMob = TextEditingController();

  var thisMail = TextEditingController();
  Future<void> UpdateData() async {
    var data = {
      'name': thisName.text,
      'mobile_no': thisMob.text.toString(),
      'email': thisMail.text,
      'login_id':widget.id.toString(),
    };

    var response =
        await post(Uri.parse('${con.url}/stationProfileUpdate.php'), body: data);
    jsonDecode(response.body);
    if (jsonDecode(response.body)['result']=='Success') {
      setState(() {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Successfully updated')));
      });
    } else {
      setState(() {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to Update')));
      });
    }
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
    print(widget.name);
    print(widget.mob);
    print(widget.mail);
    thisName.text = widget.name;
    thisMob.text = widget.mob;
    thisMail.text = widget.mail;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      // init: LocationController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            // leading: Icon(Icons.arrow_back),
            title: Center(child: Text('Edit Details')),
            toolbarHeight: 70,
            backgroundColor: Color.fromARGB(255, 101, 3, 153),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  '    User Name',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    color: Colors.black,
                    child: TextFormField(
                      controller: thisName,
                      decoration: InputDecoration(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white,
                        // hintText: 'ENTER YOUR NAME',
                        prefixIcon: Icon(
                          Icons.person_outline,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '    Mobile No',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    color: Colors.black,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: thisMob,
                      decoration: InputDecoration(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white,
                        // hintText: 'ENTER YOUR PHONE NUMBER',
                        prefixIcon: Icon(
                          Icons.phone_outlined,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  '    Email',
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    color: Colors.black,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: thisMail,
                      decoration: InputDecoration(
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.white,
                        // hintText: 'ENTER YOUR EMAIL',
                        prefixIcon: Icon(
                          Icons.mail_outline_rounded,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Card(
                    //     elevation: 10,
                    //     color: Colors.blue,
                    //     child: Container(
                    //       width: double.infinity,
                    //       height: 120,
                    //       color: Colors.white,
                    //       child: Column(
                    //         children: [
                    //           SizedBox(
                    //             height: 20,
                    //           ),
                    //           Text(
                    //             '$locContent',
                    //             textAlign: TextAlign.center,
                    //             style: locContent ==
                    //                     'Click button below to get the location'
                    //                 ? TextStyle(color: Colors.red, fontSize: 18)
                    //                 : TextStyle(
                    //                     color: Colors.black, fontSize: 18),
                    //           ),
                    //           SizedBox(
                    //             height: 20,
                    //           ),
                    //           Visibility(
                    //             visible: locContent ==
                    //                     'Click button below to get the location'
                    //                 ? true
                    //                 : false,
                    //             child: OutlinedButton(
                    //                 onPressed: () async {
                    //                   await controller
                    //                       .getCurrentLocation()
                    //                       .toString();
                    //                   locContent = controller.currentLocation!;
                    //                   controller.currentLocation == null
                    //                       ? '--no Llocation selected--'
                    //                       : controller.currentLocation == null
                    //                           ? '--wait for a while to get location or tap again below after a few seconds'
                    //                           : controller.currentLocation!;
                    //                   myLatitude = controller.myLat;
                    //                   myLongitude = controller.myLong;
                    //                   print(myLatitude);
                    //                   print(myLongitude);
                    //                   print('My Location :$locContent');
                    //                 },
                    //                 child: Text('Get Location')),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 210),
                  child: Container(
                      height: 40,
                      width: 120,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 101, 3, 153),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            print(thisName.text);
                            print(thisMob.text);
                            print(thisMail.text);
                            print(widget.id);

                            setState(() {
                              UpdateData();
                            });
                          },
                          child: Text('Submit'))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
