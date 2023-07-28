import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/Station/home/HomePage.dart';
import 'package:spot_ev/Screens/User/navBar/navBar.dart';
import 'package:spot_ev/Screens/User/navBar/stations/stationDetailPage.dart';
import 'package:spot_ev/Screens/connect.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:spot_ev/Screens/styles/textstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class BookASection extends StatefulWidget {
  String id;
  BookASection({Key? key, required this.id}) : super(key: key);

  @override
  State<BookASection> createState() => _BookASectionState();
}

class _BookASectionState extends State<BookASection> {
  var flag = 0;
  var selection;
  var selectedTime = false;

  String dropdownValue = '01:00 - 01:30';

 List<String> dropdownOptions  = [
    '01:00 - 01:30',
    '01:30 - 02:00',
    '02:00 - 02:30',
    '02:30 - 03:00',
    '03:00 - 03:30',
    '03:30 - 04:00',
  ];

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }

   
  }
String? name;
   Future<void> getData({required name}) async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    var sp = pref.getString('LoginID');

    
      var data={
        "id":sp,
        "station_id": widget.id,
        "time": dropdownValue,
        "date": selectedDate.toString()
      };
      print(data);
      var response = await post(Uri.parse('${con.url}/book-slot.php'),body: data);
      print(response.body);
      var res = jsonDecode(response.body);
      if(res['result']=='failed'){
      ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('This slot is not available ! ')));
      
          }
          else{
             ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Successfully Booked... ')));
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return BottomNavBar();
            // },
            // ));
            //  Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return BottomNavBar();
            // },
            // ));
            // email
            // name

            launchUrl(Uri.parse('upi://pay?pa=shannanminda27@okhdfcbank&pn=$name&am=270.00&cu=INR&aid=uGICAgICNgb2BfQ'));
     
          }
    }

    Future<dynamic> gData() async {
      var data={
        'id':widget.id
      };
      var res =await post(Uri.parse('${con.url}/StationRead.php'),body: data);
      print(res.body);
      var r = jsonDecode(res.body);
      return r;
    }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Book a section')),
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 101, 3, 153),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder(
            future: gData(),
            builder: (context,snapshot) {
              if(snapshot.hasData){
                  return Column(
                children: [
                  SizedBox(height: 40,),
                  Text('Choode a date'),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => _selectDate(context),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   
                                    Text(
                                      selectedDate != null
                                          ? selectedDate.toString().split(' ')[0]
                                          : 'Select Date',style: TextStyle(color: Colors.black),
                                    ),
                                     Icon(Icons.calendar_today),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text('Choode a Time'),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(16.0),
                              child: DropdownButton<String>(
                                value: dropdownValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: dropdownOptions
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                            Icon(Icons.timelapse)
                          ],
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getData(name:snapshot.data[0]['name']);
                      // Lottie.asset('Images/loading.json');
                    },
                    child: Text('Book Slot'),
                  ),
                ],
              );
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            
            }
          ),
        ),
      ),
    );
  }
}
