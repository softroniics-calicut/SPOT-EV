import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../styles/textstyle.dart';
class StationOverViewPage extends StatelessWidget {
  const StationOverViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Icon(Icons.location_on_outlined,color: Color(0xff0000FF),),
              SizedBox(width: 7,),
              Text('CALICUT Road,Perinthalmanna,Kerala 679322',style: TextStyle(color: Color(0xff0000FF)),),
            ],
          ),
          SizedBox(height: 7,),
          Row(
            children: [
              Icon(CupertinoIcons.clock,color: Color(0xff0000FF),),
              SizedBox(width: 7,),
              Text('Open 24 hours',style: TextStyle(color: Colors.green),),
            ],
          ),
          SizedBox(height: 7,),
          Row(
            children: [
              Icon(CupertinoIcons.globe,color: Color(0xff0000FF),),
              SizedBox(width: 7,),
              Text('www.yxvestby.com/',style: TextStyle(color: Color(0xff0000FF)),),
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                elevation: 10,
                child: Container(height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xff0000FF)
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Text('110 kw'),
                      SizedBox(height: 5,),
                      Text('CSS'),
                      SizedBox(height: 5,),
                      Icon(CupertinoIcons.ellipsis_circle,color: Color(0xff0000FF),),
                      SizedBox(height: 5,),
                      Text('3/4 taken', style: TextStyle(color: Colors.green),)
                    ],
                  )
                  ,),
              ),
              Card(
                elevation: 10,
                child: Container(height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xff0000FF)
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Text('50 kw'),
                      SizedBox(height: 5,),
                      Text('Type2'),
                      SizedBox(height: 5,),
                      Icon(CupertinoIcons.ellipsis_circle,color: Color(0xff0000FF),),
                      SizedBox(height: 5,),
                      Text('3/3 taken', style: TextStyle(color: Colors.red),)
                    ],
                  )
                  ,),
              ),
              Card(
                elevation: 10,
                child: Container(height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Color(0xff0000FF)
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Text('22 kw'),
                      SizedBox(height: 5,),
                      Text('CHAdeMo/CSS'),
                      SizedBox(height: 5,),
                      Icon(CupertinoIcons.ellipsis_circle,color: Color(0xff0000FF),),
                      SizedBox(height: 5,),
                      Text('0/1 taken', style: TextStyle(color: Colors.red),)
                    ],
                  )
                  ,),
              ),

            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('4.0',style: blackbold,),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.amber,),
                    Icon(Icons.star,color: Colors.amber,),
                    Icon(Icons.star,color: Colors.amber,),
                    Icon(Icons.star,color: Colors.amber,),
                    Icon(Icons.star_border),
                    Text('(12)'),
                  ],
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/review.png'),
                      )
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Color(0xff0000FF),
              thickness: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
