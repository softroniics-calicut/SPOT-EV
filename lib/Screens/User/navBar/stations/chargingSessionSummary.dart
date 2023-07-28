import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/styles/textstyle.dart';


import '../navBar.dart';
class ChargingSessionPage extends StatelessWidget {
  const ChargingSessionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(onPressed: () {  },
        icon: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
        },)),
        title: Center(child: Text('Charging Session summary')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Thank You',style: TextStyle(color: Color(0xff0000FF)),),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xff0000FF),
                  )
                ),
                child: Column(
                  children: [
                    Text('Session Details',style:TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Charging Station'),
                              Text('Connnector Type '),
                              Text('Charging Point ID'),
                              Text('Duration'),
                              Text('Energy Delivered'),
                              Text('Session Traffic'),
                              Text('Session Start Time'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('YX Vestby'),
                              Text('Type-2'),
                              Text('YX vestby-AMB-CP10'),
                              Text('00:20:36'),
                              Text('2:30 kw '),
                              Text('Rs 15.00/kw'),
                              Text('30.04.2023 7:14 PM'),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 125,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(0xff0000FF),
                  )
                ),
                child: Column(
                  children: [
                    Text('Invoice Details',style:TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Charging Fee'),
                              Text('Tax'),
                              Text('Total Amount'),

                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rs.12.00'),
                              Text('Rs.0.60'),
                              Text('Rs.12.60'),

                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                height: 270,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xff0000FF),
                    )
                ),
                child: Column(
                  children: [
                    Text('Feedback',style:TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold,fontSize: 18),),
                    SizedBox(height: 20,),
                    Text('Please rate your experience',style: black,),
                    Padding(
                      padding: const EdgeInsets.only(left: 86),
                      child: Container(
                        height: 50,
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                          return Icon(Icons.star_border,size:40,color: Color(0xff0000FF),);
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  color: Color(0xff0000FF),
                                ),
                                backgroundColor: Colors.white,
                              foregroundColor: Colors.black
                              ),
                              onPressed: (){}, child: Text('Have a Suggestion?'))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  side: BorderSide(
                                    color: Color(0xff0000FF),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.black
                              ),
                              onPressed: (){}, child: Text('Submit feedback'))),
                    )

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
