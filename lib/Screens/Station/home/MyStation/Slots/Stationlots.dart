import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/connect.dart';
import 'SlotsDropDowns.dart';
class StationSlotPage extends StatefulWidget {
  const StationSlotPage({Key? key}) : super(key: key);

  @override
  State<StationSlotPage> createState() => _StationSlotPageState();
}
Future<String?> getLoginId() async {
  SharedPreferences pref =await SharedPreferences.getInstance();
  String? LoginID=pref.getString('LoginID');
  return LoginID;
}
var uid;
var flag = 0;

Future<dynamic> RecieveData() async {
  uid=await getLoginId();
  print('uid: $uid');

  var data={
    'station_id':uid,
  };
  var response=await post(Uri.parse('${con.url}/slotsListViewPage.php',),body:data);
  if(uid!=null)
    print('uid: $uid');
  else{
    print('uid value not found');
  }
  //print(response.body);
  print(response.body);
  if(jsonDecode(response.body)[0]['result']=='Success'){
    flag=1;
    print(response.body);

  }else{
    flag=0;
    print(response.body);

  }

  return jsonDecode(response.body);

}

class _StationSlotPageState extends State<StationSlotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: const Center(child: Text('Slots')),
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 101, 3, 153),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
              height: 500,
              child: FutureBuilder(
                future: RecieveData(),
                builder: ( context,snapshot) {
                  print('flag inside future: $flag');
                  if(snapshot.hasError)print(snapshot.error);
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return const Center(child: Text('Waiting for connection....!!'),);
                  }
                  if(!snapshot.hasData || snapshot.data.length==0){
                    return const Center(child: Text('No Data found....!!'),);
                  }
                  return flag==1?
                  ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                      color: Colors.grey,
                                      width: 0.5,
                                    )
                                )
                            ),
                            child: ListTile(
                              leading: const Icon(Icons.ev_station_outlined),
                              trailing: const Text('0/1'),
                              title: Row(

                                children: [
                                  Text('${snapshot.data[index]['connector_type']} '),
                                  Text(': ${snapshot.data[index]['power_capacity']} KW '),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  const Text('Unit Price',style: TextStyle(color: Colors.red),),
                                  Text(': ₹ ${snapshot.data[index]['price']} /hour'),
                                ],
                              ),
                            ),
                          ),
                        );
                      }):
                      Center(child: Text('No slots added ...'),);
                  ;
                },

              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:200),
              child: Container(
                height: 50,
                width: 130,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 101, 3, 153),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DropDownButtonPage()));
                    }, child: const Row(
                   children: [
                    Icon(Icons.add),
                    Text('  Add Slot'),
                  ],
                )),
              ),
            )

          ],
        ),
      ),
    );
  }
}
