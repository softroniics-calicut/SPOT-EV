import 'package:flutter/material.dart';
class StationProfileEdit extends StatelessWidget {
  const StationProfileEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(

          children: [
            Column(

              children: [
                Container(
                  height: 150,
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
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back,color: Colors.white,),),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Text('Change profile picture'),
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

                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'ENTER YOUR NAME',
                            prefixIcon: Icon(Icons.person_outline,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('    Mobile No',),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        color: Colors.black,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'ENTER YOUR PHONE NUMBER',
                            prefixIcon: Icon(Icons.phone_outlined,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('    Email',),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        color: Colors.black,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'ENTER YOUR EMAIL',
                            prefixIcon: Icon(Icons.mail_outline_rounded,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('    Password',),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        color: Colors.black,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'ENTER YOUR PASSWORD',
                            prefixIcon: Icon(Icons.lock_outline,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 6,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text('    Confirm Password',),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        color: Colors.black,
                        child: TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'CONFIRM PASSWORD',
                            prefixIcon: Icon(Icons.lock_outline,),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18,),
                Container(
                  height: 40,
                  width: 350,
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        backgroundColor: Color.fromARGB(255, 101, 3, 153),



                      ),
                      onPressed: (){}, child: Text('Edit Profile', style: TextStyle(color: Colors.white),)),
                ),

              ],
            ),
            Positioned(
              top: 70,
              left: 140,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(62),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff0A1E93),Colors.lightBlueAccent]
                          )
                      ),
                      child: Icon(Icons.person_add_alt,size: 40,color: Colors.white,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
