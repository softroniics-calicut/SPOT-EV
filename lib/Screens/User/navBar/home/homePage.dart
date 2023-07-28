import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../styles/textstyle.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
double _curentValue=50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/location.png'),fit: BoxFit.cover
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5,right: 50,top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search a location',

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(25),
                )
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 0,top: 15),
            child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.black,
                  child: GestureDetector(
                    onTap: (){
                      showModalBottomSheet(context: context, builder: (context){
                        return Container(
                          height: 800,
                          width: double.infinity,
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 10,),
                                  child: Text('Station Status',style: black,),
                                ),
                                SizedBox(height: 20,),
                                Row
                                  (
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 80,
                                      child: OutlinedButton(
                                          style:OutlinedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: Colors.black,
                                            side: BorderSide(
                                              color:  Color(0xff0000FF),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                            )
                                          ),
                                          onPressed: (){}, child: Text('All',style: stnbtn,)),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 80,
                                      child: OutlinedButton(
                                          style:OutlinedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: Colors.black,
                                            side: BorderSide(
                                              color:  Color(0xff0000FF),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                            )
                                          ),
                                          onPressed: (){}, child: Text('Available',style: stnbtn,)),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 87,
                                      child: OutlinedButton(
                                          style:OutlinedButton.styleFrom(
                                            backgroundColor: Colors.transparent,
                                            foregroundColor: Colors.black,
                                            side: BorderSide(
                                              color:  Color(0xff0000FF),
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20)
                                            )
                                          ),
                                          onPressed: (){
                                          }, child: Text('Unavailable',style: stnbtn,)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 10,),
                                  child: Text('Charger Type',style: black,),
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 80,
                                      child: OutlinedButton(
                                          style:OutlinedButton.styleFrom(
                                              backgroundColor: Colors.transparent,
                                              foregroundColor: Colors.black,
                                              side: BorderSide(
                                                color: Color(0xff0000FF),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20)
                                              )
                                          ),
                                          onPressed: (){}, child: Text('AC',style: stnbtn,)),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 80,
                                      child: OutlinedButton(
                                          style:OutlinedButton.styleFrom(
                                              backgroundColor: Colors.transparent,
                                              foregroundColor: Colors.black,
                                              side: BorderSide(
                                                color:  Color(0xff0000FF),
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20)
                                              )
                                          ),
                                          onPressed: (){}, child: Text('DC',style: stnbtn,)),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 80,
                                      child: OutlinedButton(
                                          style:OutlinedButton.styleFrom(
                                              backgroundColor: Colors.transparent,

                                              side: BorderSide(
                                                color: Colors.white,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20)
                                              )
                                          ),
                                          onPressed: (){}, child: Text('',style: stnbtn,)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 10,),
                                  child: Text('Connector Type',style: black,),
                                ),
                                SizedBox(height: 15,),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 80,
                                          child: OutlinedButton(
                                              style:OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  foregroundColor: Colors.black,
                                                  side: BorderSide(
                                                    color:  Color(0xff0000FF),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                  )
                                              ),
                                              onPressed: (){}, child: Text('All',style: stnbtn,)),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          child: OutlinedButton(
                                              style:OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  foregroundColor: Colors.black,
                                                  side: BorderSide(
                                                    color:  Color(0xff0000FF),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                  )
                                              ),
                                              onPressed: (){}, child: Text('CCS2',style: stnbtn,)),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          child: OutlinedButton(
                                              style:OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  foregroundColor: Colors.black,
                                                  side: BorderSide(
                                                    color: Color(0xff0000FF),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                  )
                                              ),
                                              onPressed: (){}, child: Text('CCS',style: stnbtn,)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 7,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 80,
                                          child: OutlinedButton(
                                              style:OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  foregroundColor: Colors.black,
                                                  side: BorderSide(
                                                    color:  Color(0xff0000FF),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                  )
                                              ),
                                              onPressed: (){}, child: Text('GB/T',style: stnbtn,)),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          child: OutlinedButton(
                                              style:OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  foregroundColor: Colors.black,
                                                  side: BorderSide(
                                                    color:  Color(0xff0000FF),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                  )
                                              ),
                                              onPressed: (){}, child: Text('IEC 60309',style: stnbtn,)),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          child: OutlinedButton(
                                              style:OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  foregroundColor: Colors.black,
                                                  side: BorderSide(
                                                    color: Color(0xff0000FF),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                  )
                                              ),
                                              onPressed: (){}, child: Text('CHAdeMo',style: stnbtn,)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 7,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 80,
                                          child: OutlinedButton(
                                              style:OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  foregroundColor: Colors.black,
                                                  side: BorderSide(
                                                    color:  Color(0xff0000FF),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                  )
                                              ),
                                              onPressed: (){}, child: Text('15 AMP SWITCH',style: stnbtn,)),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          child: OutlinedButton(
                                              style:OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,
                                                  foregroundColor: Colors.black,
                                                  side: BorderSide(
                                                    color:  Color(0xff0000FF),
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                  )
                                              ),
                                              onPressed: (){}, child: Text('Type-2',style: stnbtn,)),
                                        ),
                                        Container(
                                          height: 30,
                                          width: 80,
                                          child: OutlinedButton(
                                              style:OutlinedButton.styleFrom(
                                                  backgroundColor: Colors.transparent,

                                                  side: BorderSide(
                                                    color: Colors.white
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20)
                                                  )
                                              ),
                                              onPressed: (){}, child: Text('',style: stnbtn,)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 10,),
                                  child: Text('Charger Type',style: black,),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('0 km'),
                                    Slider(value: _curentValue,
                                        divisions: 10,
                                        max:100,
                                        onChanged: (double value){
                                      setState(() {
                                        _curentValue=value;
                                      });
                                        }),
                                    Text('100 km')
                                  ],
                                ),
                                Center(child: Text('50 km')),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.currency_rupee_sharp,size: 17,),
                                        Text('0'),
                                      ],
                                    ),
                                    Slider(value: _curentValue,
                                        divisions: 10,
                                        max:100,
                                        onChanged: (double value){
                                      setState(() {
                                        _curentValue=value;
                                      });
                                        }),
                                    Row(
                                      children: [
                                        Icon(Icons.currency_rupee_sharp,size: 17,),
                                        Text('1000'),
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.currency_rupee,size: 17,),
                                    Text('50 Price/Unit'),
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Card(
                                      child: Container(
                                          height: 50,
                                width: 140,
                                child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                        side: BorderSide(
                                          color: Color(0xff0000FF),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                        )
                                      ),
                                      onPressed: (){}, child: Text('Clear Filters'))),
                                    ) ,
                                    SizedBox(width: 20,),
                                    Container(
                                        height: 50,
                                width: 140,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(255, 101, 3, 153),
                                      foregroundColor: Colors.white,
                                      side: BorderSide(
                                        color: Color(0xff0000FF),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                    onPressed: (){}, child: Text('Apply Filters')))
                                  ],
                                )

                              ],
                            ),
                          ),
                        );
                      });
                    },
                    child: CircleAvatar(
                        radius: 22.5,
                        backgroundColor: Colors.white,
                        child: Icon(CupertinoIcons.slider_horizontal_3,color: Colors.black,)),
                  ),
                )),
          ),
          Align(
              alignment: Alignment.center,
              child: Icon(Icons.location_on,size: 100,color: Colors.red,)),
          Padding(
            padding: const EdgeInsets.only(right: 10,bottom: 40),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 21.5,
                    backgroundColor: Colors.white,
                    child: Icon(CupertinoIcons.location_fill,color: Colors.black,),
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}
