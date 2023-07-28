import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/User/navBar/home/homePage.dart';
import 'package:spot_ev/Screens/connect.dart';


import 'Screens/Station/BottomNavBarPage.dart';
import 'Screens/Station/home/HomePage.dart';
import 'Screens/User/navBar/navBar.dart';
import 'Screens/User/navBar/stations/map.dart';
import 'Screens/signup.dart';
import 'Screens/forgetPassword.dart';
import 'Screens/styles/textstyle.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.type}) : super(key: key);
  var type;

  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  Future<void> saveLoginId(String LoginID)  async {
     SharedPreferences prefs=await SharedPreferences.getInstance();

   prefs.setString('LoginID',LoginID);


  }
  var visible = true;
  var mail = TextEditingController();
  var pass = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Future<void> sendData() async {
    var data = {
      'email': mail.text,
      'password': pass.text,
      'user_type': widget.type,
    };
    var response = await post(Uri.parse('${con.url}/login.php'), body: data);
    print(response.body);
    print(jsonDecode(response.body));
    var LoginID;
    LoginID=jsonDecode(response.body)['log_id'];
    print('...........................................$LoginID');
    if(LoginID!=null)
    saveLoginId(LoginID);
    if (jsonDecode(response.body)['result'] == 'User successfully login') {
      final spref = await SharedPreferences.getInstance();
        spref.setString('regi_id', LoginID);
      if (widget.type == 'user') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>BottomNavBar()));
            // Nature()
            //  BottomNavBar()));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user login')));
      }
      if (widget.type == 'station') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StationBottomNavBArPage()));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('station login')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Invalid Credential')));
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => LoginPage(type: widget.type)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SizedBox(height: 50,),
              Container(
                height: 100,
                width: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logoo.png'),
                        fit: BoxFit.contain)),
              ),
               SizedBox(
                height: 30,
              ),
              Text(
                'Sign In',
                style: TextStyle(color: Color.fromARGB(255, 101, 3, 153),fontWeight: FontWeight.bold,fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  key: formkey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '    Email',
                          style: email,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 10,
                            color: Colors.black,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: mail,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Colors.grey[350],
                                hintText: 'ENTER YOUR EMAIL',
                                prefixIcon: Icon(
                                  Icons.mail_outline_rounded,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '    Password',
                          style: email,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 10,
                            color: Colors.black,
                            child: TextFormField(
                              obscureText: visible,
                              controller: pass,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Colors.grey[350],
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visible = !visible;
                                      });
                                    },
                                    icon: visible
                                        ? Icon(CupertinoIcons.eye_slash_fill)
                                        : Icon(CupertinoIcons.eye)),
                                hintText: 'ENTER YOUR PASSWORD',
                                prefixIcon: Icon(
                                  Icons.lock_outline_rounded,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 200),
                        //   child: Center(
                        //       child: TextButton(
                        //           onPressed: () {
                        //             Navigator.push(
                        //                 context,
                        //                 MaterialPageRoute(
                        //                     builder: (context) =>
                        //                         ForgetPassword()));
                        //           },
                        //           child: Text(
                        //             'Forgot Password ?',
                        //           ))),
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Container(
                                height: 50,
                                width: 320,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),elevation: 20,
                                      backgroundColor: Color.fromARGB(255, 101, 3, 153),
                                    ),
                                    onPressed: () {
                                      print(mail.text);
                                      print(pass.text);
                                      if (mail.text.isNotEmpty &&
                                          pass.text.isNotEmpty) {
                                        print('inside if');
                                        setState(() {
                                          sendData();
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content:
                                                    Text('All fields required')));
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => LoginPage(
                                                    type: widget.type)));
                                      }
          
                                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
                                    },
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                           
                              SizedBox(
                                height: 20,
                              ),
                             
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Text(
                                    'Don\'t Have an Account?',
                                    style: email,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => signUPPage(
                                                      type: widget.type,
                                                    )));
                                      },
                                      child: Text(
                                        'Sign Up',style: TextStyle(color: Color.fromARGB(255, 101, 3, 153)),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        )
                      ])),
            ]),
          ),
        ),
      ),
    );
  }
}
