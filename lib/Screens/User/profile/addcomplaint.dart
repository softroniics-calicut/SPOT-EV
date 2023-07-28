import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/User/navBar/stations/stationDetailPage.dart';
import 'package:spot_ev/Screens/User/profile/complaints.dart';
import 'package:spot_ev/Screens/connect.dart';


class AddComplaint extends StatefulWidget {
  String id;
  AddComplaint({super.key, required this.id});

  @override
  State<AddComplaint> createState() => _AddComplaintState();
}

class _AddComplaintState extends State<AddComplaint> {

var comp = TextEditingController();
  
  Future<void> addData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var sp = pref.getString('LoginID');
    var data={
      "sid":widget.id,
      "id":sp,
      "type":dropdownValue,
      "complaint":comp.text,
    };
    print(data);
    var response =await post(Uri.parse('${con.url}/add-complaints.php'),body: data);
    print(response.body);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Complaints(id: sp.toString());
    },));
  }

   var selectedTime = false;

  String dropdownValue = 'Slow Charging';

 List<String> dropdownOptions  = [
    'Charger faculty',
    'Network Issue',
    'Slow Charging',
    'Others',
 
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Write your Complaint',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
           Padding(
            padding: const EdgeInsets.only(bottom: 28,left: 28,right: 28),
            child: TextFormField(
              controller: comp,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          
          ElevatedButton(onPressed: (){
            addData();
          }, child: Text('ADD'))
        ],
      ),
    );
  }
}