import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:spot_ev/Screens/connect.dart';
import 'package:spot_ev/Screens/styles/textstyle.dart';

import 'changePasswordPage.dart';


class EditProfilePage extends StatefulWidget {
   EditProfilePage({Key? key,required this.name,required this.mail,required this.mob,required this.id}) : super(key: key);
  var name,mob,mail,id;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var thisname=TextEditingController();

  var thismail=TextEditingController();

  var thismob=TextEditingController();

  Future<void> UpdateProfile() async {
    var data={
      'name':thisname.text,
      'email':thismail.text,
      'mobile_no':thismob.text,
      'login_id':widget.id.toString(),
    };
    var response=await post(Uri.parse('${con.url}/UserProfileEdit.php'),body: data);
    print(response.body);
 
    if(jsonDecode(response.body)['result']=='Success'){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Updated')));
      Navigator.pop(context);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Not Updated')));
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    setState(() {});
    super.initState();
    print(widget.name);
    print(widget.mob);
    print(widget.mail);
    thisname.text = widget.name;
    thismob.text = widget.mob;
    thismail.text = widget.mail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(backgroundColor: Color.fromARGB(255, 101, 3, 153),elevation: 0,title: Text('Change Profile',),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(

            children: [
              Column(

                children: [
                  Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 101, 3, 153),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)
                      )
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // children: [
                      //   IconButton(onPressed: () {
                      //     Navigator.pop(context);
                      //   }, icon: Icon(Icons.arrow_back,color: Colors.white,),),
                      // ],
                    ),
                  ),
                  SizedBox(height: 50,),
                  // Text('Change profile picture'),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('    User Name',),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          color: Colors.black,
                          child: TextFormField(
                            controller: thisname,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              filled: true,
                              fillColor: Colors.white,

                              prefixIcon: Icon(Icons.person_outline,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6,),
                      Text('    Mobile No',),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          color: Colors.black,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: thismob,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              filled: true,
                              fillColor: Colors.white,

                              prefixIcon: Icon(Icons.phone_outlined,),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 6,),
                      Text('    Email',),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 10,
                          color: Colors.black,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: thismail,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none
                              ),
                              filled: true,
                              fillColor: Colors.white,

                              prefixIcon: Icon(Icons.mail_outline_rounded,),
                            ),
                          ),
                        ),
                      ),

                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordPage()));
                      }, child: Text('   Change Password'))
                    ],
                  ),

                  SizedBox(height: 18,),
                  Container(
                    height: 40,
                    width: 200,
                    child: ElevatedButton(
                        style:ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: Color.fromARGB(255, 101, 3, 153),



                        ),
                        onPressed: (){
                          setState(() {
                            UpdateProfile();
                          });
                        }, child: Text('Edit Profile', style: TextStyle(color: Colors.white),)),
                  ),

                ],
              ),
              Positioned(
                top: 70,
                left: 140,
                child: Center(
                  child: Column(
                    children: [
                      // Container(
                      //   height: 125,
                      //   width: 125,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(62),
                      //       gradient: LinearGradient(
                      //           begin: Alignment.topLeft,
                      //           end: Alignment.bottomRight,
                      //           colors: [Color(0xff0A1E93),Colors.lightBlueAccent]
                      //       )
                      //   ),
                      //   child: Icon(Icons.person_add_alt,size: 40,color: Colors.white,),
                      // ),
              ],
               ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
