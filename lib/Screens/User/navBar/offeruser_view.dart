import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/User/navBar/services.dart';
import 'package:spot_ev/Screens/connect.dart';


import '../../styles/textstyle.dart';
class OfferPageuser extends StatefulWidget {
  const OfferPageuser({Key? key}) : super(key: key);

  @override
  State<OfferPageuser> createState() => _OfferPageuserState();
}

class _OfferPageuserState extends State<OfferPageuser> {
  XFile? pickedFile;
  File? image;

  File? pickedImage;

  Future<dynamic> getData() async {
    // var data={
    //   "id":
    // };
    // print(data);
    var response = await get(Uri.parse('${con.url}/viewoffer1.php'));
    print(response);
    var res = jsonDecode(response.body);
    print(res);
    return res;
  }

  addOffer(BuildContext context) async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('LoginID');
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$sp');
    if (pickedImage != null) {
      final data = await Services.postWithIamge(
          endPoint: 'add-offer.php',
          params: {
            'id': sp,
          },
          
          image: pickedImage!,
          imageParameter: 'pic');

      if ((data as Map)['result'] == 'done') {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => OfferPageuser(),
          ),
        );
      } else {
        // Fluttertoast.showToast(msg: 'Complaint registered');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return OfferPageuser();
          },
        ));
      }
    } else {
      // Fluttertoast.showToast(msg: 'Pick image ');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Offers')),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: getData(),
          builder: (context,snap) {
            if(snap.hasData){
              if(snap.data[0]['result']=='Success'){
                return Expanded(
                   child: Column(
                                 children: [
                  
                               
                                   SizedBox(height: 40,),
                                 
                    Expanded(
                      child: ListView.builder(
                        itemCount: snap.data.length,
                        itemBuilder: (context, index) {
                          return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(child: Image.network('${con.img}${snap.data[index]['img']}')),
                        );
                        },
                       
                      ),
                    ),
                                   
                                 ]
                       ),
                 );
              }
              else{
                return Center(child: Text('No Offers are added !'),);
              }
                 
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
           
          }
        )
      )
    );
  }
}
