import 'package:flutter/material.dart';

import '../../../styles/textstyle.dart';
import 'StationRatingPage.dart';

class StationReviewPage extends StatefulWidget {
  StationReviewPage({Key? key}) : super(key: key);

  @override
  State<StationReviewPage> createState() => _StationReviewPageState();
}

class _StationReviewPageState extends State<StationReviewPage> {
  var is_selected = false;

  var is_selected_down = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/review.png'),
                )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StationRatingPage()));
                },
                child: Container(
                    child: Column(
                  children: [
                    Text(
                      ' Rate and Review',
                      style: black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(' Share your experience to help others'),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          StationRatingPage()));
                            },
                            icon: Icon(Icons.navigate_next))
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.green,
                          child: Text('A'),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.black,
                          size: 35,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.black,
                          size: 35,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.black,
                          size: 35,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.black,
                          size: 35,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.black,
                          size: 35,
                        ),
                      ],
                    ),
                  ],
                )),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.blueGrey,
              ),
              Text(
                'Sort by',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 30,
                        width: 90,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.grey,
                              foregroundColor: Color.fromARGB(255, 101, 3, 153),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Top Rated',
                              style: TextStyle(fontSize: 12),
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 30,
                        width: 90,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Newest',
                              style: TextStyle(fontSize: 12),
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 30,
                        width: 90,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Highest',
                              style: TextStyle(fontSize: 12),
                            ))),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 30,
                        width: 90,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Lowest',
                              style: TextStyle(fontSize: 12),
                            ))),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black, width: 0.5))),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.red,
                                child: Text(
                                  'A',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text('Amjid p'),
                              subtitle: Text('Best service not much of days'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          is_selected = !is_selected;
                                        });
                                      },
                                      icon: (is_selected)
                                          ? Icon(
                                              Icons.thumb_up,
                                              color: Color(0xff0000FF),
                                            )
                                          : Icon(
                                              Icons.thumb_up_alt_outlined,
                                              color: Color(0xff0000FF),
                                            )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  IconButton(
                                    icon: (is_selected_down)
                                        ? Icon(
                                            Icons.thumb_down,
                                            color: Color(0xff0000FF),
                                          )
                                        : Icon(
                                            Icons.thumb_down_alt_outlined,
                                            color: Color(0xff0000FF),
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        is_selected_down = !is_selected_down;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 65,
                              ),
                              child: Container(
                                height: 0,
                                child: ListView.builder(
                                    itemCount: 5,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      );
                                    }),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
