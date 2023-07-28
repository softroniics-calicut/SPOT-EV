import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/styles/textstyle.dart';
class OTPPage extends StatelessWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
            color:  Color.fromARGB(255, 101, 3, 153),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40)
        )

      ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xff0000FF),
                  child: CircleAvatar(
                    radius: 39,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.mobile_friendly_rounded,color: Color.fromARGB(255, 101, 3, 153),size: 40,),
                  ),
                ),
                SizedBox(height: 15,),
                Text('SENT OTP',style: profile,)
              ],
            ),
          ),
          SizedBox(height: 50,),

          Text('Verification Code',style: blackbold,),
          Text('send to +91 9876543210'),
          SizedBox(height: 30,),
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
          SizedBox(height: 30,),
          Text('Didn\'t recieve an OTP ?'),
          SizedBox(height: 10,),

          TextButton(onPressed: (){}, child: Text('Resent OTP',style: TextStyle(color: Colors.black,decoration: TextDecoration.underline),)),
         SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 101, 3, 153),
                      foregroundColor: Colors.white,
                      side: BorderSide(
                        color: Color(0xff0000ff),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                    onPressed: (){}, child: Text('Submit'))),
          ),
        ],
      ),
    );
  }
}
