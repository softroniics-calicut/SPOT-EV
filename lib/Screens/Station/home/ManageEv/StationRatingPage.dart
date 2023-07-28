import 'package:flutter/material.dart';

import '../../../styles/textstyle.dart';
class StationRatingPage extends StatelessWidget {
  const StationRatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          },
              icon:
              Icon(Icons.arrow_back)),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('YX Vestyby',style: black,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  child: Text('A'),
                ),
                SizedBox(width: 15,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Anil Prakash'),
                    Row(
                      children: [
                        Text('Posting publically '),
                        Icon(Icons.info_outline,size: 18,)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Container(
              height: 50,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Icon(Icons.star,color: Colors.amber,size: 30,);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text('Share more about your experience',style: TextStyle(fontSize: 18),),
          ),
          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                expands: true,
                maxLines: null,
                minLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    hintText: 'share details of your own experience at \nthis place',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color:  Color(0xff0000FF),
                          width: 2,
                        )
                    )
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff0000FF),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt,color: Colors.deepPurple,)),
                  TextButton(onPressed: () {  },
                      child: Text('Add Yours',style: TextStyle(color: Colors.black),)),
                ],
              ),
            ),
          ),
          SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: Color.fromARGB(255, 101, 3, 153),
                        foregroundColor: Colors.white
                    ),
                    onPressed: (){}, child: Text('Post'))),
          ),
        ],
      ),
    );
  }
}
