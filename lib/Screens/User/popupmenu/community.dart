import 'package:flutter/material.dart';
class communityPage extends StatelessWidget {
  const communityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/communityBg.png'),fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}
