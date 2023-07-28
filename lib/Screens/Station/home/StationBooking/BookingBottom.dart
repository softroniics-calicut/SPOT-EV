import 'package:flutter/material.dart';

import '../../../styles/textstyle.dart';
import 'StationAllbooking.dart';
import 'StationCancelledBooking.dart';
class StationsBookingPage extends StatelessWidget {
  const StationsBookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          // leading: Icon(Icons.arrow_back),
          title: Center(child: Text('My Bookings')),
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 101, 3, 153),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
          ),
        ),
        body:  Column(
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
            //     //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       IconButton(onPressed: () {
            //         Navigator.pop(context);
            //       }, icon:Icon( Icons.arrow_back,color: Colors.white,) ),
            //       SizedBox(width: 80,),
            //       Center(child: Text('My Bookings',style: booking,textAlign: TextAlign.center,)),
            //     ],
            //   ),
            // ),
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black,
              tabs:
              [
                Tab(text: 'All Bookings',),
                Tab(text: 'Cancelled Booking',),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
              StationAllBookingPage(),
                StationCancelledBooking(),
              ]),
            )
          ],
        ),
      ),
    );

  }
}
