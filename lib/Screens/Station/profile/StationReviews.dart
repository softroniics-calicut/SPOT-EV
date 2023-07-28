import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:spot_ev/Screens/User/navBar/stations/reviewPage.dart';
import 'package:spot_ev/Screens/User/navBar/stations/stationRating.dart';
import 'package:spot_ev/Screens/connect.dart';

import '../../User/navBar/stations/review1.dart';

class StationReviews extends StatefulWidget {
  String id;
 StationReviews({super.key, required this.id});

  @override
  State<StationReviews> createState() => _StationReviewsState();
}

class _StationReviewsState extends State<StationReviews> {
   Future<dynamic> getData() async {
    var data = {"id": widget.id};
    print('..............................$data');
    var res = await post(Uri.parse('${con.url}/ratingview.php'), body: data);
    var r = jsonDecode(res.body);
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return StationRating();
    // },));
    print(r);
    return r;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
      ),
      body: Column(

        children: [
          ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StationRating1(id:widget.id);    
              },));
          }, child: Text('Add Rating')),
          FutureBuilder(
                future: getData(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    if(snap.data[0]['result']=='Success'){
                        return Expanded(
                          child: ListView.builder(
                                              itemCount: snap.data.length,
                                              itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text('Review : '+snap.data[index]['comment']),
                              subtitle:Text('user : '+snap.data[index]['name']) ,
                              trailing: Text(snap.data[index]['rating']+'  Stars',style: TextStyle(color: Color.fromARGB(255, 237, 189, 32)),) ,
                            ),
                          );
                                              },
                                            ),
                        );
                    }
                    else{
                     return Center(child: Text('No Ratings added...!'));
                    }
                  
                  }
                  else{
                    return Center(child: CircularProgressIndicator());
                  }
                }),
        ],
      )
    );
  }
}