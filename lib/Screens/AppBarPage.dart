import 'package:flutter/material.dart';
class AppBArPAge extends StatelessWidget {
  const AppBArPAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // leading: Icon(Icons.arrow_back),
        title: Center(child: Text('Station')),
        toolbarHeight: 130,
        backgroundColor: Color.fromARGB(255, 101, 3, 153),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
        ),
      ),
    );
  }
}
