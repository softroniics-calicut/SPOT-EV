import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/styles/textstyle.dart';
class OTPverification extends StatelessWidget {
  const OTPverification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Color.fromARGB(255, 101, 3, 153),
              child: Icon(Icons.done,color: Colors.white,size: 40,),
            ),
          ),
          SizedBox(height: 10,),
          Text('Successful',style: black,),
          SizedBox(height: 10,),
          Text('Your Mobile number has \n    successfully verified.'),
        ],
      ),
    );
  }
}
