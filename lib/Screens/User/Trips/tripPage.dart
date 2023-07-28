import 'package:flutter/material.dart';
import 'package:spot_ev/Screens/styles/textstyle.dart';
class TripPlannerPage extends StatelessWidget {
  const TripPlannerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/location.png'),fit: BoxFit.cover
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: Icon(Icons.arrow_back)),

                    Padding(
                      padding: const EdgeInsets.only(left: 120,top: 50),
                      child: Icon(Icons.location_on,size: 80,color: Colors.red,),
                    ),
                  ],
                ),
              ),
              Container(
                height: 260,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Trip Planner',style: black,),
                      SizedBox(height: 10,),
                      Text('Experience worry-free road trips by relying on our convinient charging station to tackle any range anxiety on your nrxt adventure.',style: stnbtn,),
                        SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.arrow_circle_right_sharp,color: Colors.red,),
                            hintText: 'Enter Starting Point',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on_outlined,color: Colors.green,),
                            hintText: 'Enter Destination',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 280,top: 2),
                        child: Container(
                            height: 35,
                            width: 100,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 101, 3, 153),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  )
                                ),
                                onPressed: (){}, child: Text('Next'))),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
