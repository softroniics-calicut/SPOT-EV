import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/User/navBar/stations/stationpayment.dart';

import '../../../styles/textstyle.dart';
class PaymentProcess extends StatefulWidget {
   PaymentProcess({Key? key}) : super(key: key);

  @override
  State<PaymentProcess> createState() => _PaymentProcessState();
}

class _PaymentProcessState extends State<PaymentProcess> {
bool checked=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Confirm Booking')),
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
          //       Text('Confirm Booking',style: booking,textAlign: TextAlign.center,),
          //     ],
          //   ),
          // ),
          SizedBox(height: 30,),
          Container(
              height: 500,
              width: 300,

              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('YX Vestby,Perithalmanna'),
                    SizedBox(height: 10,),
                    Text('Sat,13 May, 12:15 PM'),
                    SizedBox(height: 19,),
                    SizedBox(
                      width: 200,
                      child: Divider(
                        color: Color(0xff2794F9),
                        thickness: 1,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Connector',style: TextStyle(color: Color(0xff0000FF),fontSize: 18),),
                    SizedBox(height: 10,),
                    Text('Type 2 Connector'),
                    SizedBox(height: 10,),
                    Text('50 kw'),
                    SizedBox(height: 19,),
                    SizedBox(
                      width: 200,
                      child: Divider(
                        color: Color(0xff0000FF),
                        thickness: 1,
                      ),
                    ),
                    Text('User Price (Rs.100/hour)',style: TextStyle(color: Colors.green,fontSize: 18),),
                    SizedBox(height: 10,),
                    Text('Pricing',style: TextStyle(color: Color(0xff0000FF),fontSize: 18),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('45 mins'),
                        Text('Rs.80.00'),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Taxes'),

                        Text('Rs.15.20'),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Checkbox(value: checked, onChanged: (bool? value){
                          setState(() {
                            checked=value!;
                          });
                        }),
                        Text('Use Wallet Amount'),
                        Text('                   Rs.0',style: TextStyle(color: Colors.red),),

                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: 250,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,

                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',style: TextStyle(fontSize: 18),),
                        Text('Rs.95.20')
                      ],
                    ),

                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Color(0xff0000FF),
                      foregroundColor: Colors.white
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StationPayment()));
                    }, child: Text('Proceed to pay Rs.95.20'))),
          )

        ],
      ),
    );
  }
}
