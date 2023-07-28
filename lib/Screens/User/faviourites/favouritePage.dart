import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/User/faviourites/favlist.dart';
import 'package:spot_ev/Screens/connect.dart';


import '../../styles/textstyle.dart';
class favouritePage extends StatefulWidget {
  const favouritePage({Key? key}) : super(key: key);

  @override
  State<favouritePage> createState() => _favouritePageState();
}

class _favouritePageState extends State<favouritePage> {
  Future<dynamic> getData() async {
     SharedPreferences pref = await SharedPreferences.getInstance();
    var sp = pref.getString('LoginID');
    var data={
      "uid":sp,
      
    };
    print(data);
    var response = await post(Uri.parse('${con.url}/fav.php'),body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$res');
    return res;
  }

  void deleteData(a)async{
    var data={
      "id":a
    };
    var response = await post(Uri.parse('${con.url}/favdel.php'),body: data);
    print(response.body);
    setState(() {
       print(response.body);

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Favorite')),
        toolbarHeight: 80,
        backgroundColor:  Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            SizedBox(height: 15,),
            Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder(
                future: getData(),
                builder: (context,snap) {
                  if(snap.hasData){
                    if(snap.data[0]['result']=='Success'){
                      return ListView.builder(
                    itemCount: snap.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:   Color.fromARGB(255, 101, 3, 153),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ListTile(
                              leading: Icon(CupertinoIcons.heart_fill,color: Colors.red,),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Text(snap.data[index]['name']),
                                  Text(snap.data[index]['location']),
                                  // Text('${fav[index]['add']}'),
                                  // Text('${fav[index]['pin']}'),
                        
                                ],
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  deleteData(snap.data[index]['fav_id']);
                                },
                                child: Icon(Icons.delete,color:  Color.fromARGB(255, 101, 3, 153),)),
                            ),
                          ),
                        ),
                      );
                    },

                  );
                    }
                    else{
                      return Center(child: Text('No items added to Favourites !'),);
                    }
                       
                  }
                  else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                 
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
