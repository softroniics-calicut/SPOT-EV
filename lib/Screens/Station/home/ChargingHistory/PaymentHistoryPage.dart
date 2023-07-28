import 'package:flutter/material.dart';

import 'StationChargingHistoryDetails.dart';
class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Payment History')),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('   Sort by'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [


                Container(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          foregroundColor: Color(0xff0000FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                      onPressed: (){}, child: Text('Bydate')),
                ),

                Container(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xff000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(
                              color: Colors.black
                          )
                      ),
                      onPressed: (){}, child: Text('Newest')),
                ),

                Container(
                  height: 30,
                  width: 90,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Color(0xff000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(
                              color: Colors.black
                          )
                      ),
                      onPressed: (){}, child: Text('Oldest')),
                ),
                IconButton(onPressed: (){
                  showDatePicker(context: context, initialDate:DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime(2100));
                }, icon: Icon(Icons.calendar_month,color: Colors.red,size: 35,))
              ],
            ),

            SizedBox(height: 15,),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: Stationcharging.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 10,
                      child: GestureDetector(
                        onTap: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>StationPayemntHistory(
                          //  price:Stationcharging[index]['rate'],
                        //  ),));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 90,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 101, 3, 153),
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child:Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.person_outline,color: Color(0xff0000FF),),
                                title: Text('${Stationcharging[index]['name']}'),
                                trailing: Text('Rs${Stationcharging[index]['rate']}'),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(' ${Stationcharging[index]['date']}'),
                                  ),
                                  SizedBox(width: 20,),
                                  Text('${Stationcharging[index]['time']}'),
                                ],
                              ),
                            ],
                          )
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
