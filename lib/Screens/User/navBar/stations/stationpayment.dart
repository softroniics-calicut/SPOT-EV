import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/styles/textstyle.dart';

import 'chargingSessionSummary.dart';
class StationPayment extends StatefulWidget {
  StationPayment({Key? key}) : super(key: key);

  @override
  State<StationPayment> createState() => _StationPaymentState();
}

class _StationPaymentState extends State<StationPayment> {
bool is_checked=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Payment')),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: 20,),
              Text('Select your method',style:TextStyle(fontSize: 18),),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/gpay.jpg'),fit: BoxFit.cover
                      )
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/paytm.jpg'),fit: BoxFit.cover
                      )
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/phnpe.jpg'),fit: BoxFit.cover
                      )
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text('Enter your payment details',style: TextStyle(fontSize: 18),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'CARD HOLDER NAME',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      )
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'CARD NUMBER',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      )
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
               //   direction: Axis.horizontal,
               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                     // flex: 2,
                     // width: 185,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'EXP DATE',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            )
                          )
                        ),
                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(
                      //width: 180,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'CVV',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5,
                            )
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('  Remember card detail\'s'),
                  Checkbox(value: is_checked,
                      onChanged: (bool? value){
                      setState(() {
                        is_checked=!is_checked;
                      });
                      })

                ],
              ),
              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:  Color.fromARGB(255, 101, 3, 153),
                          foregroundColor: Colors.white
                        ),
                        onPressed: (){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text('Your Booking is successfully completed'),
                              actions: [
                                TextButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChargingSessionPage()));
                                }, child: Text('Ok',style: TextStyle(color: Colors.black),))
                              ],
                            );
                          });
                        }, child: Text('Book Now'))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
