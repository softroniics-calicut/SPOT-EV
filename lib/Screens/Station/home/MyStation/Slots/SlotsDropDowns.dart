import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/connect.dart';

import '../../../../styles/textstyle.dart';
import 'Stationlots.dart';

//mport '../../../styles/textstyle.dart';
class DropDownButtonPage extends StatefulWidget {
  DropDownButtonPage({Key? key}) : super(key: key);

  @override
  State<DropDownButtonPage> createState() => _DropDownButtonPageState();
}

class _DropDownButtonPageState extends State<DropDownButtonPage> {
  var Data = [];
  var drop_flag = 0;
  // var charger = [
  //   'CHAdeMo',
  //   'CCS',
  //   'TYPE-2',
  //   'GB/T',
  //   'CCS2',
  // ];
  // var price = [
  //   100,
  //   200,
  //   110,
  //   150,
  //   50,
  // ];

  var connector_id;


  Future<String?> getLoginId() async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    String? LoginID=pref.getString('LoginID');
    return LoginID;
  }
  var Sid;

  Future<void> SendData() async {
    Sid= await getLoginId();
    var data = {
      // 'connector_type': chargerValue,
      // 'power_capacity': voltagevalue.toString(),
      // 'price': priceValue.toString(),
       'connector_id': connector_id.toString(),
      'station_id':Sid.toString(),
    };
    var response =
        await post(Uri.parse('${con.url}/insertSlot.php'), body: data);

    if(Sid!=null)
      print('user_id: $Sid');
    else{
      print('uid value not found');
    }

    print(response.body);
    if (jsonDecode(response.body)['result'] == 'Success') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('slot Added')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StationSlotPage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('slot denied')));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => StationSlotPage()));
    }
    @override
    void initstate(){
      super.initState();
      setState(() {
        getLoginId();
      });
    }
  }
  Future<void> RecieveDropDown() async {
    var response=await post(Uri.parse('${con.url}/ViewSlotDropDownList.php'));
    if (response.statusCode == 200 &&
        jsonDecode(response.body)[0]['result'] == 'Success') {
      drop_flag = 1;
      var Complaint_type = jsonDecode(response.body);
      print('*********************************************');
      print('Slots are = $Complaint_type');

      setState(() {
        Data = Complaint_type
            .map((listItem) => {
          'connector_type': listItem['connector_type'],
          'power_capacity': listItem['power_capacity'],
          'price': listItem['price'],
          'connector_id': listItem['connector_id'],
        })
            .toList();
      });
      print('*********************************************');

      print('ListData is = $Data');
      // return jsonDecode(response.body);
    }

  }
  @override
  void initState() {
    super.initState();
    RecieveDropDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Add Slots')),
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
          ),

          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff0000ff),
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: DropdownButton(
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  underline: Container(),
                  isExpanded: true,
                  hint: Text(' Add'),
                  value: connector_id,
                  items: Data
                      .map((e) => DropdownMenuItem(
                            child: ListTile(
                              title: Text('${e['connector_type']} '),
                              subtitle: Text('${e['power_capacity']} kw'),
                              trailing: Text('₹ ${e['price']} '),
                            ),
                            value: e['connector_id'].toString(),
                          )).toList(),
                  onChanged: (val) {
                    setState(() {
                      connector_id = val;
                    });
                  }),
            ),
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text('Disable slot'),
          //     SizedBox(width: 20,),
          //     Switch(value: switchselect,
          //         onChanged: (bool? value){
          //       setState(() {
          //         switchselect=!switchselect;
          //       });
          //         })
          //   ],
          // ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 101, 3, 153),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  onPressed: () {
                    // print(voltagevalue);
                    // print(chargerValue);
                    // print(priceValue);
                    //  print(uid);
                    setState(() {
                      SendData();
                    });
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 18),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
