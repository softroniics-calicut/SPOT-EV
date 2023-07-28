import 'package:flutter/material.dart';
class StationCancelledBooking extends StatelessWidget {
  const StationCancelledBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                height: 330,
                width: double.infinity,
                decoration: BoxDecoration(
                color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.white
                      ),
                      top: BorderSide(
                          color: Colors.black
                      ),
                      left: BorderSide(
                          color: Colors.black
                      ),
                      right: BorderSide(
                          color: Colors.black
                      )
                  ),
                ),
                child: Column(
                children: [
                Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                border: Border(
                bottom: BorderSide(
                color: Colors.black
                ),

                )
                ),
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('02 May 2021'),
          ),
          ),
          Column(
          children: [
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
          children: [
          Icon(Icons.person_2_outlined,color: Color(0xff0000FF),size: 30,),
          Text(' Williamz',style: TextStyle(
          fontSize: 18
          ),),
          Expanded(
          child: ListTile(
          trailing: Icon(Icons.call,color: Color(0xff0000ff),),
          ),
          ),
          ],
          ),
          ),


          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
          children: [
          Icon(Icons.brightness_auto_outlined, color: Color(0xff0000ff),size: 30,),
          Text(' DC Type 1',style: TextStyle(
          fontSize: 18
          ),),


          ],
          ),
          ),
          SizedBox(height: 10,),

          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          CircleAvatar(
          radius: 5,
          backgroundColor: Color(0xff0000FF),
          ),
          Container(
          height: 0.5,
          width: 100,
          color: Colors.black,
          ),

          Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(

          color: Colors.transparent,
          border: Border.all(
          color: Colors.blueAccent
          )
          ),
          child: Center(child: Text('45 min')),
          ),
          Container(
          height: 0.5,
          width: 100,
          color: Colors.black,
          ),
          CircleAvatar(
          radius: 5,
          backgroundColor: Color(0xff00FF00),
          ),
          ],
          ),
          Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
          Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('1:15 PM'),
          Text('12 May 2023')
          ],
          ),
          Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          Text('1:15 PM'),
          Text('12 May 2023')
          ],
          )
          ],),
          ),
          SizedBox(height: 10,),
          Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
          color: Color(0xffC99F96),
          border: Border(
          top: BorderSide(
          color: Colors.black45
          )
          )
          ),
          child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Session Charge',style: TextStyle(
          fontSize: 18
          ),),
          Text('Rs.250',style: TextStyle(
          fontSize: 18
          ),)
          ],
          ),
          ),
          )
          ],
          )
          ],
          ),
          ),

          ),
            ],
          );
        },

      ),
    );
  }
}
