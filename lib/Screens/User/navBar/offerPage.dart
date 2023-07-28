import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spot_ev/Screens/User/navBar/services.dart';
import 'package:spot_ev/Screens/connect.dart';


import '../../styles/textstyle.dart';
class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  XFile? pickedFile;
  File? image;

  File? pickedImage;

  Future<dynamic> getData() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
    var sp = pref.getString('LoginID');
    var data={

      "id":sp
    };
    print(data);
    var response = await post(Uri.parse('${con.url}/viewoffer.php'),body: data);
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
            builder: (_) => OfferPage(),
          ),
        );
      } else {
        // Fluttertoast.showToast(msg: 'Complaint registered');
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return OfferPage();
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
        title: Center(child: Text('Offer')),
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
                 return Expanded(
                   child: Column(
                                 children: [
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      Text('Add New Offer',style: TextStyle(color: Color.fromARGB(255, 18, 79, 128),fontSize: 18),),
                       FloatingActionButton(onPressed: () async {
                           File? temp = await Services.pickImage(context);
                                  setState(() {
                                    pickedImage = temp;
                                    print(pickedImage);
                                  });
                                  print(pickedImage!.path);
                        },child: Icon(Icons.camera_alt,)),
                     ],
                   ),
                   ElevatedButton(onPressed: (){
                    addOffer(context);
                   }, child: Text('ADD')),
                                 
                                   SizedBox(height: 40,),
                                 
                    Expanded(
                      child: ListView.builder(
                        itemCount: snap.data.length,
                        itemBuilder: (context, index) {
                          return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network('${con.img}${snap.data[index]['img']}'),
                        );
                        },
                       
                      ),
                    ),
                                   
                                 ]
                       ),
                 );
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
