import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:spot_ev/Screens/connect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tata extends StatefulWidget {
  const Tata({super.key});

  @override
  State<Tata> createState() => _TataState();
}

class _TataState extends State<Tata> {
 Future<dynamic> getData() async {
  var response = await get(Uri.parse('${con.url}/tata.php'));
  print(response.body);
  // return 0;
  var res = jsonDecode(response.body);
  return res;


 }



  
   Future<dynamic> addData(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var sp = pref.getString('LoginID');
    var data={
      'id':sp,
      'v_id':id
    };
    print('object');
  var response = await post(Uri.parse('${con.url}/add.php'),body: data);
  print(response.body);
  // return 0;
  var res = jsonDecode(response.body);
  return res;


 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context,snap) {
          if(snap.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snap.data[0]['result']=='Success'){
             return ListView.builder(
            itemCount: snap.data.length,
            itemBuilder: ((BuildContext context, int index) {
               return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Card(
                  child: ListTile(
                    leading:Container(child: Image.network('${con.image}${snap.data[index]['image']}',fit: BoxFit.cover,height: 100,),),
                    title: Text(snap.data[index]['name'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    subtitle: Text(snap.data[index]['brand'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    trailing: SizedBox(
                      height: 40,width: 40,
                      child: FloatingActionButton(onPressed: (){
                        // print('object1');
                        addData(snap.data[index]['v_id']);
                      },child: Icon(Icons.add),backgroundColor: Color.fromARGB(255, 72, 10, 134),)),
                  ),
                ),
              );
            }),
          );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
         
        }
      ),
    );
  }
}
