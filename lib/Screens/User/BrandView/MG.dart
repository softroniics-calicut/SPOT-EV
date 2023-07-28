import 'package:flutter/material.dart';

class MG extends StatefulWidget {
  const MG({super.key});

  @override
  State<MG> createState() => _MGState();
}

class _MGState extends State<MG> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(45, 0, 10, 10),
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(120, 10, 10, 0),
                      child: Column(
                        children: [
                          Text(
                            "MG Z5 EV",
                            style: TextStyle(fontSize: 17),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "Images/Type2.png",
                                        height: 23,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Type-2",
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "Images/CCS2.png",
                                        height: 28,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text("CCS-2"),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "Images/Chademo.png",
                                    color: Color.fromARGB(255, 9, 110, 39),
                                    height: 22,
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Text(
                                    "CHAdeMO",
                                    style: TextStyle(fontSize: 13),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Image.asset(
                    ('Images/MG Z5 EV.png'),
                    height: 150,
                    width: 170,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
