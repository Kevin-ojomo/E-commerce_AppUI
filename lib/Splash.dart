// import 'dart:js';
import 'package:assignment_flutter/Home.dart';

import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);
  static String routeName = "/splash";

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: double.infinity,
        // width: double.infinity,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/camera.jpg'),
        //   )
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Icon(
              Icons.music_note,
              size: 100,
              color: Colors.deepPurple,
            )),
            Center(
                child: Text("Utopia",
                    style: TextStyle(
                      fontFamily: 'muri',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    )))
          ],
        ),
      ),
    );
  }
}
