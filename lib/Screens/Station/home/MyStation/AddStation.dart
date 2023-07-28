import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/Station/home/ManageEv/stationSubmitPage.dart';

import '../../../styles/textstyle.dart';
class AddStation extends StatefulWidget {
  AddStation({Key? key}) : super(key: key);

  @override
  State<AddStation> createState() => _AddStationState();
}

class _AddStationState extends State<AddStation> {
    bool light=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Add Station')),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body: Column(
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
          //       SizedBox(width: 100,),
          //       Text('Add Station',style: booking,textAlign: TextAlign.center,),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 22,top: 20),
            child: Text('Name',style: TextStyle(fontSize: 18),),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.ev_station_outlined),
                hintText: 'Enter Station Name',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),

                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),

                )
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22,top: 20),
                    child: Text('Location',style: TextStyle(fontSize: 18),),
                  ),
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,top: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.location_on_outlined),
                            hintText: 'Location',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),

                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),

                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 20),
                    child: Text('City',style: TextStyle(fontSize: 18),),
                  ),

                  SizedBox(
                    width: 180,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20,top: 10),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_city),
                            hintText: 'City',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),

                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),

                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.all(20),
             child: TextField(
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.receipt_long),
                  hintText: 'Lattitude,Longitude',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),

                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),

                  ),
              ),
          ),
           ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Station Disabled',style: TextStyle(fontSize: 18),),
              Switch(value: light, onChanged: (bool? value){
                setState(() {
                  light=!light;
                });
              }),
            ],
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 101, 3, 153),
                    foregroundColor: Color(0xffffffff)
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStationAndSubmitPage()));
                  }, child: Text('Submit')),
            ),
          )





        ],
      ),
    );
  }
}
