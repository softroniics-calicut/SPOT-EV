import 'package:flutter/material.dart';
class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
    // leading: Icon(Icons.arrow_back),
    title: Center(child: Text('change Password')),
    toolbarHeight: 70,
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
            SizedBox(height: 26,),
            Text('    Old password',),
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
            Text('    New password',),
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
            SizedBox(height: 6,),
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
                    hintText: 'CONFIRM NEW PASSWORD',
                    prefixIcon: Icon(Icons.lock_outline,),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
      
            Center(
              child: Container(
                height: 40,
                width: 200,
                child: ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      backgroundColor: Color.fromARGB(255, 101, 3, 153),
      
      
      
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    }, child: Text('Change', style: TextStyle(color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
