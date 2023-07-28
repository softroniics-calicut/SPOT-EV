import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/styles/textstyle.dart';

import 'createNewPassword.dart';
class PasswordVerification extends StatelessWidget {
  const PasswordVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Forgot Password')),
        toolbarHeight: 130,
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body: Column(
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
          //       SizedBox(width: 60,),
          //       Text('Forgot Password',style: booking,textAlign: TextAlign.center,),
          //     ],
          //   ),
          // ),
          SizedBox(height: 40,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Text('Get your code',textAlign:TextAlign.center,style: TextStyle(color: Color.fromARGB(255, 101, 3, 153),fontSize: 18),),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(40),
                child: Text('Please enter the 4 digit code that we have send to your email address',style:TextStyle(
                    fontSize: 18
                ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: TextField(

                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0000FF),

                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: TextField(

                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0000FF),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: TextField(

                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0000FF),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: TextField(

                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff0000FF),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Didn\'t recieve code ?'),
                  TextButton(onPressed: (){}, child: Text('Resend')),
                ],
              ),
              SizedBox(height: 20),
              Container(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color.fromARGB(255, 101, 3, 153),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateNewPassword()));
                      }, child: Text('Verify and Proceed')))
            ],
          ),
        ],
      ),
    );
  }
}
