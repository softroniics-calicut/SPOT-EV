import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/User/profile/addcomplaint.dart';
import 'package:spot_ev/Screens/connect.dart';

class Complaints extends StatefulWidget {
  String id;
  Complaints({super.key, required this.id});

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {

   Future<dynamic> RecieveData() async {

     SharedPreferences pref = await SharedPreferences.getInstance();
    var sp = pref.getString('LoginID');
    var data={
      "id":sp,
      // "sid":widget.id
    };
 
    var response =
    await post(Uri.parse('${con.url}/complaints.php'),body: data);
    
    // print(response.body);
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
   
  }

  // Future<void> addComp() async {
  //      SharedPreferences pref = await SharedPreferences.getInstance();
  //   var sp = pref.getString('LoginID');
  //   var data={
  //     'sid':widget.id,
  //     'id':sp,
      
  //   };
  //   var response = post(Uri.parse('uri'),body: data);
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
      ),
      body: FutureBuilder(
        future: RecieveData(),
        builder: (context,snapshot) {
          if(snapshot.hasData){
                return Column(
                  children: [
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return AddComplaint(id: widget.id);
                      },),);
                    }, child: Text('Add Complaints'), style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(250, 146, 27, 205)
                ),)),
                    Expanded(
                      child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Station : ${snapshot.data[index]['name']}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    Text(snapshot.data[index]['date']),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                           Text(snapshot.data[index]['complain_type'],style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(snapshot.data[index]['description']),
                         
                        ],
                      ),
                      height: 150,width: double.infinity,color: Color.fromARGB(26, 101, 3, 153)
                                ),
                                  );
                                },
                              
                              ),
                    ),
                  ],
                );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
         
      
        }
      ),
    );
  }
}