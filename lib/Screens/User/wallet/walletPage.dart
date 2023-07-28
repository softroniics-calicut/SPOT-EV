import 'package:flutter/material.dart';

import '../../styles/textstyle.dart';
class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Wallet')),
        toolbarHeight: 80,
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body:  SafeArea(
        child: SingleChildScrollView(
          
          child: Column(
            children: [
              // Container(
              //   height: 150,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 101, 3, 153),
              //       borderRadius: BorderRadius.only(
              //           bottomLeft: Radius.circular(30),
              //           bottomRight: Radius.circular(30)
              //       )
              //   ),
              //   child: Row(
              //     children: [
              //       IconButton(onPressed: () {
              //         Navigator.pop(context);
              //       }, icon:Icon( Icons.arrow_back,color: Colors.white,) ),
              //       SizedBox(width: 100,),
              //       Text('Wallet',style: booking,textAlign: TextAlign.center,),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                  color: Color(0xff435E6B),
                  borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Balance',style: profile,),
                        SizedBox(height: 6,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.currency_rupee_sharp,color: Colors.white,),
                                Text('0',style: profile,),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Color(0xffE35C32),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(child: Text('Add Credits',style: profile,)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 90,),
              Container(
                width: double.infinity,
                height: 390,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(height: 10,),
                          Text('Credits',style: TextStyle(
                            fontSize: 18
                          ),),
                        SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                              radius:15,
                              child: Icon(Icons.currency_rupee_sharp,size: 20,color: Colors.black,)),
                          SizedBox(width: 130,),
                          Text('1 credits=1 INR')
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('   Amount',textAlign: TextAlign.start,),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(

                          hintText: 'Enter Amount',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 101, 3, 153),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.currency_rupee_sharp,size: 20,),
                                Text('25',style: TextStyle(
                                  fontSize: 18
                                ),)
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 101, 3, 153),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.currency_rupee_sharp,size: 20,),
                                Text('50',style: TextStyle(
                                  fontSize: 18
                                ),)
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 101, 3, 153),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.currency_rupee_sharp,size: 20,),
                                Text('100',style: TextStyle(
                                  fontSize: 18
                                ),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ), Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 101, 3, 153),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.currency_rupee_sharp,size: 20,),
                                Text('500',style: TextStyle(
                                  fontSize: 18
                                ),)
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 101, 3, 153),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.currency_rupee_sharp,size: 20,),
                                Text('1000',style: TextStyle(
                                  fontSize: 18
                                ),)
                              ],
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color.fromARGB(255, 101, 3, 153),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.currency_rupee_sharp,size: 20,),
                                Text('2000',style: TextStyle(
                                  fontSize: 18
                                ),)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Price'),
                          Text('0 INR')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style:ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 101, 3, 153),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                            ),
                            onPressed: (){}, child:Text('Proceed to Pay',style: profile,)),
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
