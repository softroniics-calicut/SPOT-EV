import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/User/profile/profile.dart';
import 'package:spot_ev/Screens/connect.dart';

import '../../styles/textstyle.dart';

class complaintPage extends StatefulWidget {
  complaintPage({Key? key}) : super(key: key);

  @override
  State<complaintPage> createState() => _complaintPageState();
}

class _complaintPageState extends State<complaintPage> {
  var stationId;
  List complaintType = [
    'Charger Faculty',
    'Slow Charging',
    'Network Issue',
    'Voltage Fluctuation'
  ];
  var ListData = [];
  var drop_flag = 0;
  var selectedIndex;
  var selectedComplaint;
  var selectedOtherComplaints;

  var item = [
    'Charging and front shocker regarding',
    'Wrong Product sold with safety, Quality and Security compromised',
    'battery mileage issue',
    'Battery Issues',
    'Battery replacement issue',
  ];
  Future<void> StationName() async {
    var response = await post(Uri.parse('${con.url}/StationReadProfile.php'));
    print(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['result'] == 'Success') {
      drop_flag = 1;
      var stationName = jsonDecode(response.body);
      print('*********************************************');
      print('stationName is = $stationName');

      setState(() {
        ListData = stationName
            .map((listItem) => {
                  'login_id': listItem['login_id'],
                  'place': listItem['place'],
                  'name': listItem['name'],
                })
            .toList();
      });
      print('*********************************************');

      print('ListData is = $ListData');
      // return jsonDecode(response.body);
    }
    // else
    //   drop_flag=0;
    // drop_flag==1?      item=jsonDecode(response.body):item.add('Nothing to show');
  }

  @override
  void initState() {
    super.initState();
    StationName();
  }

 var des=TextEditingController();

  Future<String?> getLoginId() async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    String? LoginID=pref.getString('LoginID');
    return LoginID;
  }
  var uid;
  var flag = 0;
  Future<void> refresh() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {

    });
  }
  Future<void> sendData()
  async {
    uid= await getLoginId();
    var data={
      'station_id':stationId.toString(),
      'user_id':uid.toString(),
      'complaint_type':selectedComplaint,
      'other_complaints':item.toString(),
      'description':des.text,
      'date':DateTime.now().toString(),
    };
    var response=await post(Uri.parse('${con.url}/complaintInsertPage.php'),body: data);

    if(uid!=null)
      print('user_id: $uid');
    else{
      print('uid value not found');
    }
    print(response.body);

    if(jsonDecode(response.body)['result'] == 'Success'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Complaint registerd...!')));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfilePage()));

    }
    else {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Complaint not registered...!'))) ;
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
    }
  }
  @override
  void initstate(){
    super.initState();
    setState(() {
      getLoginId();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.arrow_back),
          title: Center(child: Text('Complaints')),
          toolbarHeight: 70,
          backgroundColor: Color.fromARGB(255, 101, 3, 153),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
        ),
        body: SingleChildScrollView(
          child: ListData.isEmpty
              ? Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Center(
                        child: Text(
                      'No stations Availabe to complaint..\n Try after Sometime.....',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    )),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      '  Station Name',
                      style: black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff000000),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            underline: Container(),
                            isExpanded: true,
                            hint: Text('  Station name'),
                            value: stationId,
                            items: ListData.map((e) => DropdownMenuItem(
                                  child: Text('${e['name']},${e['place']}'),
                                  value: e['login_id'].toString(),
                                )).toList(),
                            onChanged: (val) {
                              setState(() {
                                stationId = val;
                              });
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        'Complaint Type',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 4,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      width: 1,
                                      color: Color.fromARGB(255, 101, 3, 153),
                                    ),
                                    backgroundColor: selectedIndex == index
                                        ? Color.fromARGB(255, 101, 3, 153)
                                        : Colors.transparent,
                                    foregroundColor: selectedIndex == index
                                        ? Colors.white
                                        : Color.fromARGB(255, 101, 3, 153),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      selectedIndex = index;
                                      selectedComplaint =
                                          complaintType[selectedIndex];
                                    });
                                  },
                                  child: Text('${complaintType[index]}'));
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff000000),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                            style: TextStyle(fontSize: 16, color: Colors.black),
                            underline: Container(),
                            isExpanded: true,
                            hint: Text('  Other'),
                            value: selectedOtherComplaints,
                            items: item
                                .map((e) => DropdownMenuItem(
                                      child: Text('$e'),
                                      value: e,
                                    ))
                                .toList(),
                            onChanged: (val) {
                              setState(() {
                                selectedOtherComplaints = val;
                              });
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: des,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        // expands: true,

                        decoration: InputDecoration(
                            hintText:
                                'Write short description \nEnter your concern here...',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Color(0xff000000),
                              width: 2,
                            ))),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 101, 3, 153),
                                  foregroundColor: Colors.white),
                              onPressed: () {
                                print(uid);
                                print(selectedComplaint);
                                print(stationId);
                                print(des.text);
                                print(selectedOtherComplaints);
                                print(DateTime.now());
                                setState(() {
                                  sendData();
                                });
                              },
                              child: Text('Raise a Complaint'))),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
