import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/User/profile/addcomplaint.dart';
import 'package:spot_ev/Screens/connect.dart';

class Complaintss extends StatefulWidget {

 const Complaintss({super.key});

  @override
  State<Complaintss> createState() => _ComplaintssState();
}

class _ComplaintssState extends State<Complaintss> {

   Future<dynamic> RecieveData() async {

     SharedPreferences pref = await SharedPreferences.getInstance();
    var sp = pref.getString('LoginID');
    var data={
      "id":sp,
      // "sid":widget.id
    };
 
    var response =
    await post(Uri.parse('${con.url}/Complaints.php'),body: data);
    
    // print(response.body);
    print(response.body);
    var res = jsonDecode(response.body);
    print(res);
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
        title: Text('Complaints'),
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
      ),
      body: FutureBuilder(
        future: RecieveData(),
        builder: (context,snapshot) {
          if(snapshot.hasData){
            if(snapshot.data[0]['result']=='Success'){
               return Column(
                  children: [
                   
                    Expanded(
                      child: ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color.fromARGB(39, 101, 3, 153)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(snapshot.data[index]['name'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                    Text(snapshot.data[index]['date']),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                           Text(snapshot.data[index]['complain_type'],style: TextStyle(fontWeight: FontWeight.bold),),
                            Text(snapshot.data[index]['description']),
                         
                        ],
                      ),
                      height: 150,width: double.infinity,
                                ),
                                  );
                                },
                              
                              ),
                    ),
                  ],
                );
            }
            else{
              return Center(child: Text('No Complaints Added...'),);
            }
               
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
         
      
        }
      ),
    );
  }
}