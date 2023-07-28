import 'package:flutter/material.dart';
class CreateNEwPasswordPage extends StatelessWidget {
  const CreateNEwPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Change Password')),
        toolbarHeight: 70,
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30,),
          Text('    Old Password',),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              color: Colors.black,
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'ENTER YOUR OLD PASSWORD',
                  prefixIcon: Icon(Icons.lock_outline,),
                ),
              ),
            ),
          ),
          SizedBox(height: 6,),
          Text('    New Password',),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              color: Colors.black,
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'NEW PASSWORD',
                  prefixIcon: Icon(Icons.lock_outline,),
                ),
              ),
            ),
          ),
          Text('    Confirm Password',),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              color: Colors.black,
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'NEW PASSWORD',
                  prefixIcon: Icon(Icons.lock_outline,),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 210),
            child: Container(
                height: 40,
                width: 120,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 101, 3, 153),
                      foregroundColor: Colors.white
                    ),
                    onPressed: (){}, child: Text('Submit'))),
          ),
        ],
      ),
    );
  }
}
