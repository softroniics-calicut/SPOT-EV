import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/textstyle.dart';
import 'package:spot_ev/Screens/connect.dart';


import 'SELECTFILE.dart';
class ManageVehicle extends StatefulWidget {
  const ManageVehicle({Key? key}) : super(key: key);

  @override
  State<ManageVehicle> createState() => _ManageVehicleState();
}

class _ManageVehicleState extends State<ManageVehicle> {
  Future<dynamic> getData() async {
     SharedPreferences pref =await SharedPreferences.getInstance();
    String? sp=pref.getString('LoginID');
    var data={
      'id':sp
    };
    print(data);
    var response =await post(Uri.parse('${con.url}/myvehicle.php'),body: data);
    print(response.body);
    var res= jsonDecode(response.body);
    return res;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Manage vehicle')),
        toolbarHeight: 80,
        backgroundColor:  Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 150,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 101, 3, 153),
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(30),
              //           bottomRight: Radius.circular(30)
              //       )
              //   ),
              //   child: Row(
              //     children: [
              //       IconButton(onPressed: () {
              //         Navigator.pop(context);
              //       }, icon:Icon( Icons.arrow_back,color: Colors.white,) ),
              //       SizedBox(width: 65,),
              //       Text('Manage Vehicle',style: booking,textAlign: TextAlign.center,),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('Add a New Vehicle',style: TextStyle(color: Colors.black,fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectVehicle()));
                    },
                    child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(30, 100, 8, 137),
                          borderRadius: BorderRadius.circular(10),),
                        child: Image(image: AssetImage('assets/addcar.webp'),fit: BoxFit.cover,)

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text('My Vehicle',style: TextStyle(color: Colors.black,fontSize: 18),),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: FutureBuilder(
                  future: getData(),
                  builder: (context,snap) {
                    if(snap.hasData){
                      if(snap.connectionState==ConnectionState.waiting){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      if(snap.data[0]['result']=='Success'){
                          return ListView.builder(
                        itemCount: snap.data.length,
                        itemBuilder: (context,index){
                      return  Padding(
                        padding: const EdgeInsets.all(15),
                        child: Center(
                          child: Container(
                            height: 100,
                            width:300,
                            decoration: BoxDecoration(
                              color: Color(0xffB5B5D3),
                              borderRadius: BorderRadius.circular(10),),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.car_crash,color: Color.fromARGB(255, 101, 3, 153),size: 35,),
                                SizedBox(width: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(snap.data[index]['name'],style:TextStyle(
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 101, 3, 153),
                                    ),),
                                     Text(snap.data[index]['brand'],style:TextStyle(
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 101, 3, 153),
                                    ),),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                      }
                      else{
                        return Center(child:Text('Select Your Vehicle'),);
                      }
                      
                     
                    }
                    else{
                      return Center(child: CircularProgressIndicator());
                    }
                   
                  }
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}
