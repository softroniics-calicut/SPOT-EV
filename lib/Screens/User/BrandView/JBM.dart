import 'package:flutter/material.dart';

class BUS extends StatefulWidget {
  const BUS({super.key});

  @override
  State<BUS> createState() => _BUSState();
}

class _BUSState extends State<BUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => Stack(
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
                          "JBM SKYLIFE BUS",
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
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
                            Row(
                              children: [
                                Image.asset(
                                  "Images/CCS2.png",
                                  height: 28,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Type-2"),
                              ],
                            ),
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
                  ('Images/Volvo-Bus-PNG-Photo.png'),
                  height: 140,
                  width: 190,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
