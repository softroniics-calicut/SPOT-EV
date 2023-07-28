import 'package:flutter/material.dart';
class AddStationAndSubmitPage extends StatelessWidget {
  const AddStationAndSubmitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/location.png'),fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search,color: Colors.black,),
                    hintStyle: TextStyle(color: Colors.black),
                    hintText: 'Search a location',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              Icon(Icons.location_on,color: Colors.red,size: 80,),
              Padding(
                padding: const EdgeInsets.all(20),
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
                      onPressed: (){}, child: Text('Submit')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
