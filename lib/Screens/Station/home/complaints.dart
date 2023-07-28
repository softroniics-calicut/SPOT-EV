import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/connect.dart';

import '../../styles/textstyle.dart';
class ComplaintPage extends StatefulWidget {
   ComplaintPage({Key? key}) : super(key: key);

  @override
  State<ComplaintPage> createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  Future<String?> getLoginId() async {
    SharedPreferences pref =await SharedPreferences.getInstance();
    String? LoginID=pref.getString('LoginID');
    return LoginID;
  }

  var uid;

  var flag = 0;

  Future<void> refresh() async {
    await Future.delayed(Duration(seconds: 2));
  }

  Future<dynamic> RecieveData() async {
    uid=await getLoginId();
    print('uid: $uid');
    var data = {'station_id': uid};
    var response =
    await post(Uri.parse('${con.url}/complaintViewPage.php'), body: data);
    if(uid!=null)
      print('uid: $uid');
    else{
      print('uid value not found');
    }
    //print(response.body);
    print(response.body);
    if (jsonDecode(response.body)[0]['result'] == 'Success') {
      flag = 1;
      print(response.body);
    } else {
      flag = 0;
      print(response.body);
    }
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
                
            Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder(
                future: RecieveData(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                    if(snapshot.data[0]['result']=='Success'){
                        return 
                   ListView.builder(
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 10,
                            color: Colors.black,
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text('${snapshot.data[index]['date']}',style: normal,),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Name',style: normal,),
                                            Text('Complaint Type',style: normal,),
                                            SizedBox(height: 07,),
                                            Wrap(children:[ Text('Description',style: normal,)]),
                        
                        
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('    :  ${snapshot.data[index]['name']}',style: normal,),
                                            Text('    :  ${snapshot.data[index]['complain_type']}',style: normal,),
                        
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5,),
                                    Expanded(child: Container(
                                        height: 35,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xff0000ff),
                                          )
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Center(child: Text('${snapshot.data[index]['description']}',style: TextStyle(fontSize: 12,color: Colors.red),),),
                                        )))
                                  ],
                                ),
                              ),
                        
                            ),
                          ),
                        );
                      });
                    }
                    else{
                      return Center(child: Text('No Complaints!'),);
                    }
                   
                  }
                  else{
                    return Center(child: CircularProgressIndicator());
                  }
                  
                  

                
                }, 
                  // print('flag inside future: $flag');
                  // print(snapshot.data[0]['name']);
                  // print(snapshot.data[0]['complain_type']);
                  // print(snapshot.data[0]['description']);
                  // print(snapshot.data[0]['date']);
                  // if (snapshot.hasError) print(snapshot.error);

                 














                 
                 
                

              ),
            )


          ],
        ),
      ),
    );
  }
}

