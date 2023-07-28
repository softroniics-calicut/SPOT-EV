import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/Station/home/HomePage.dart';
import 'package:spot_ev/login.dart';
class USerORStationPage extends StatelessWidget {
   USerORStationPage({Key? key}) : super(key: key);
// var type;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Center(
              child: Container(
                height: 100,
                width: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logoo.png'),fit: BoxFit.contain

                  )
                ),
              ),
            ),
            SizedBox(height: 40,),
            Text('Join The Electric \n    rEVOLUTION',style: TextStyle(color: Color.fromARGB(255, 101, 3, 153),fontSize: 28,fontWeight: FontWeight.bold),),
           SizedBox(height: 10,),
            Text('--------- Make Vehicle charging easy ---------',style: TextStyle(color: Color.fromARGB(255, 101, 3, 153),fontSize: 13),),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 50,
                    width: 140,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 101, 3, 153),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),elevation: 20
                        ),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginPage(
                            type: "user",
                          )));
                        }, child: Text('USER',style: TextStyle(fontSize: 20),))),
                        SizedBox(height: 30,),
            Container(
                height: 50,
                width: 140,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 101, 3, 153),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1505),
                        ),elevation: 20
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage(
                        type: "station",
                      )));
                    }, child: Text('STATION',style: TextStyle(fontSize: 20),)))
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
