import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotosGridView extends StatelessWidget {
  PhotosGridView({Key? key}) : super(key: key);
List img=[
  'assets/ev 1.jpg',
  'assets/ev2.jpg',
  'assets/ev3.jpg',
  'assets/ev4.jpg',
  'assets/ev5.jpg',
  'assets/ev6.jpg',
  'assets/ev7.jpg',
  'assets/ev8.jpg',
  'assets/ev9.jpg',
  'assets/ev10.jpg',
  'assets/ev11.jpg',
  'assets/ev12.jpg',
  'assets/ev13.jpg',
  'assets/ev14.jpg',
  'assets/ev15.png',
];
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/ev 1.jpg'),fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(0xff0000FF),
                      width: 3
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 115),
                    child: Text(' All',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),
                  ),
                ),
                Container(
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ev14.jpg'),fit: BoxFit.cover
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 115),
                    child: Text(' Latest',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ),
                Container(
                  height: 150,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/ev15.png'),fit: BoxFit.cover
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 115),
                    child: Text(' Videos',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('All'),
                  Container(
                    height: 35,
                    width: 140,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(
                              color: Colors.black
                            )
                          )
                        ),
                        onPressed: (){}, child: Row(
                      children: [
                        Icon(Icons.camera_alt_outlined,color: Colors.black,),
                        Text('Add a photo',style: TextStyle(color: Color(0xff0000ff)),)
                      ],
                    )),
                  ),
                ],
              ),
            ),
           Container(
             height: 600,
             child: MasonryGridView.builder(
               itemCount: img.length,
               gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 2
             ), itemBuilder: (BuildContext context, int index) {
               return Padding(
                 padding: const EdgeInsets.all(2.5),
                 child: ClipRRect(
                     borderRadius:BorderRadius.circular(12),
                     child: Image(image: AssetImage('${img[index]}'))),
               );
             },),
           )
          ],
        ),
      ),
    );
  }
}
