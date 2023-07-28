import 'package:flutter/material.dart';

import '../../styles/textstyle.dart';
class paymentHistory extends StatefulWidget {
   paymentHistory({Key? key,required this.price}) : super(key: key);
var price;

  @override
  State<paymentHistory> createState() => _paymentHistoryState();
}

class _paymentHistoryState extends State<paymentHistory> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.arrow_back),
          title: Center(child: Text('Payment History')),
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
            //
            //     children: [
            //       IconButton(onPressed: () {
            //         Navigator.pop(context);
            //       }, icon:Icon( Icons.arrow_back,color: Colors.white,) ),
            //       SizedBox(width: 70,),
            //       Text('Payment History',style: booking,textAlign: TextAlign.center,),
            //     ],
            //   ),
            // ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.currency_rupee_sharp,size: 30,),
                Text('${widget.price}',style: blackbold,),
              ],
            ),
            SizedBox(height: 35,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height:25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white,Colors.green]
                      )
                    ),
                    child: Icon(Icons.done)),
                SizedBox(width: 46,),
                Text('Completed',style: TextStyle(fontSize: 20),),

              ],
            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.only(left: 100,right: 100),
              child: Divider(
                color: Colors.black,
                thickness: 0.3,
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('May 3,2023'),
                Text('  07:22 PM')
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                 border: Border.all(
                   color: Color.fromARGB(255, 101, 3, 153),
                 ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15,),
                      Text('Payment ID',style: normal,),
                      Text('   #6985214',style: normal,),
                      SizedBox(height: 10,),
                      Text('   To : YXVestby',style: normal,),
                      Text('   vestby@gmail.com',style: normal,),
                      SizedBox(height: 10,),
                      Text('   From : akshay',style: normal,),
                      Text('   akshay123@gmail.com',style: normal,),
                    ],
                  ),
                ),
              ),
            )

          ],
        ),
      );
  }
}
