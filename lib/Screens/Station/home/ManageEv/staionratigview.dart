import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:spot_ev/Screens/connect.dart';

class SatationRatingPage1 extends StatefulWidget {
  String id;
  SatationRatingPage1({super.key, required this.id});

  @override
  State<SatationRatingPage1> createState() => _SatationRatingPage1State();
}

class _SatationRatingPage1State extends State<SatationRatingPage1> {
  Future<dynamic> getData() async {
    var data = {"id": widget.id};
    print('..............................$data');
    var res = await post(Uri.parse('${con.url}/ratingview.php'), body: data);
    var r = jsonDecode(res.body);
    print(r);
    return r;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(249, 116, 15, 167),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snap) {
              if (snap.hasData) {
                if(snap.data[0]['result']=='Success'){
                    return ListView.builder(
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
                );
                }
                else{
                 return Center(child: Text('No Ratings added...!'));
                }
              
              }
              else{
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
