import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:spot_ev/Screens/connect.dart';
import 'package:spot_ev/Screens/styles/textstyle.dart';

import '../login.dart';
import 'User/navBar/home/homePage.dart';
import 'User/navBar/navBar.dart';
class signUPPage extends StatefulWidget {
   signUPPage({Key? key,required this.type}) : super(key: key);
var type;

  @override
  State<signUPPage> createState() => _signUPPageState();
}

class _signUPPageState extends State<signUPPage> {
  var visibility=true;
  var visibility1=true;
var name=TextEditingController();

var mobile_no=TextEditingController();

var place = TextEditingController();

var mail=TextEditingController();

var pass=TextEditingController();

var CPass=TextEditingController();

final formkey=GlobalKey<FormState>();

Future<void> sendData_user() async {
  var data={
    'name':name.text,
    'mobile_no':mobile_no.text,
    'email':mail.text,
    'place':place.text,
    'password':pass.text,
    'user_type':widget.type,
  };
  var response=await post(Uri.parse('${con.url}/UserRegistration.php'),body: data);
  print(response.body);
  jsonDecode(response.body);
  if(jsonDecode(response.body)['result']=='Success'){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registered Successfully')));
    Navigator.pop(context);
  }
  else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Failed')));
    Navigator.pop(context);

  }
}


  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "Loading", lat = "Loading";
  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    checkGps();
    super.initState();
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if(servicestatus){
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        }else if(permission == LocationPermission.deniedForever){
          print("'Location permissions are permanently denied");
        }else{
          haspermission = true;
        }
      }else{
        haspermission = true;
      }

      if(haspermission){
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    }else{
      print("GPS Service is not enabled, turn on GPS location");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    long = position.longitude.toString();
    lat = position.latitude.toString();

    setState(() {
      //refresh UI
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings).listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
  }




  Future<void> sendData_station() async {
    var data={
      'name':name.text,
      'mobile_no':mobile_no.text,
      'email':mail.text,
      'place':place.text,
      'password':pass.text,
      'user_type':widget.type,
      'latitude':lat,
      'longitude':long
    };
    print(data);
    var response=await post(Uri.parse('${con.url}/stationRegistration.php'),body: data);
    print(response.body);
    jsonDecode(response.body);
    if(jsonDecode(response.body)['result']=='Success'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registered Successfully')));
      Navigator.pop(context);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration Failed')));
      Navigator.pop(context);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Text('Sign Up',style: login,),
            SizedBox(height: 40,),
            Form(
             key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('    User Name',style: email,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      color: Colors.black,
                      child: TextFormField(
                        validator: (val){
                          if(val!.isEmpty){
                            return "Field Required";
                          }

                        },
                        controller: name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: 'ENTER YOUR NAME',
                          prefixIcon: Icon(Icons.person_outline,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text('    Mobile No',style: email,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      color: Colors.black,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        validator: (val){
                          if(val!.toString().length==10 && val!.isEmpty){
                            return "Field Reuired";
                          }
                        },
                        controller: mobile_no,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: 'ENTER YOUR PHONE NUMBER',
                          prefixIcon: Icon(Icons.phone_outlined,),
                        ),
                      ),
                    ),
                  ),
                    SizedBox(height: 6,),
                  Text('   Place',style: email,),

                   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      color: Colors.black,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        validator: (val){
                          if(val!.toString().length==10 && val!.isEmpty){
                            return "Field Reuired";
                          }
                        },
                        controller: place,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: 'ENTER YOUR PLACE',
                          prefixIcon: Icon(Icons.location_city,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text('    Email',style: email,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      color: Colors.black,
                      child: TextFormField(
                        validator: (val){
                         if(val!.isEmpty){
                           return "Field Required";
                         }
                        },
                        controller: mail,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: 'ENTER YOUR EMAIL',
                          prefixIcon: Icon(Icons.mail_outline_rounded,),
                        ),
                      ),
                    ),
                  ),

                  
                  SizedBox(height: 6,),
                  Text('    Password',style: email,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      color: Colors.black,
                      child: TextFormField(
                        validator: (val){
                          if(val!.length<=8 && val!.isEmpty){
                            return 'Password Required or too short';
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: visibility,
                        controller: pass,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              visibility=!visibility;
                            });
                          }, icon: (visibility)?Icon(CupertinoIcons.eye_slash_fill):Icon(CupertinoIcons.eye),),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: 'ENTER YOUR PASSWORD',
                          prefixIcon: Icon(Icons.lock_outline,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6,),
                  Text('    Confirm Password',style: email,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      color: Colors.black,
                      child: TextFormField(
                        validator: (val){
                          if((val!.length)<=8 || val!.isEmpty){
                            return 'Password Required or too short';
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: visibility1,
                        controller: CPass,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              visibility1=!visibility1;
                            });

                          }, icon: visibility1?Icon(CupertinoIcons.eye_slash_fill):Icon(CupertinoIcons.eye)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                          filled: true,
                          fillColor: Colors.grey[350],
                          hintText: 'CONFIRM PASSWORD',
                          prefixIcon: Icon(Icons.lock_outline,),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Center(
                    child: Container(
                      height: 50,
                      width: 340,
                      child: ElevatedButton(
                          style:ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            backgroundColor: Color.fromARGB(255, 101, 3, 153),
                  
                  
                  
                          ),
                          onPressed: (){
                            print(name.text);
                            print(mobile_no.text);
                            print(mail.text);
                            print(pass.text);
                            if(formkey.currentState!.validate()) {
                              if (pass.text == CPass.text)
                                widget.type=='user'?
                                sendData_user():sendData_station();
                              else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(
                                        'Password missmatch found!!')));
                              }
                            }
                  
                            // Navigator.pop(context);
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(
                            //   type: 'user',
                            // )));
                  
                          }, child: Text('REGISTER', style: TextStyle(color: Colors.white),)),
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 60,),
                      Text('Have an Account?',style: email,),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      }, child: Text('Sign In',style: email,))

                    ],
                  ),

                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
