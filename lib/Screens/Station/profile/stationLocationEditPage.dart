import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../LOCATION.dart';

class LocationEditPage extends StatelessWidget {
  LocationEditPage({Key? key}) : super(key: key);
  var locContent = 'Click button below to get the location';
  var myLatitude;
  var myLongitude;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LocationController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            // leading: Icon(Icons.arrow_back),
            title: Center(child: Text('Location')),
            toolbarHeight: 70,
            backgroundColor: Color.fromARGB(255, 101, 3, 153),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  color: Colors.blue,
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '$locContent',textAlign: TextAlign.center,
                          style: locContent ==
                                  'Click button below to get the location'
                              ? TextStyle(color: Colors.red, fontSize: 18)
                              : TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        SizedBox(height: 20,),
                        Visibility(
                          visible: locContent==  'Click button below to get the location'?true:false,
                          child: OutlinedButton(onPressed: () async {
                            await controller?.getCurrentLocation().toString();
                            locContent=   controller.currentLocation!;
                            controller.currentLocation==null?'--no Llocation selected--':
                            controller.currentLocation==null?'--wait for a while to get location or tap again below after a few seconds':
                            controller.currentLocation!;
                            myLatitude=controller.myLat;
                            myLongitude=controller.myLong;
                            print(myLatitude);
                            print(myLongitude);
                            print('My Location :$locContent');


                          }, child: Text('Get Location')),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
