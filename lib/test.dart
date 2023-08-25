import 'package:assignment_flutter/Home.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Slide extends StatefulWidget {
  const Slide({Key? key}) : super(key: key);
  static String routeName = "/slide";

  @override
  State<Slide> createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ PageView(
          controller: _controller,
          children :[

            Container(
              child: Image.asset("assets/images/culture.jpg"),
            ),
            Container(
              child: Image.asset("assets/images/style.jpg"),
            ),
            Column(
              children: [
                Container(
                 child: Image.asset("assets/images/style.jpg"),

                  
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Home.routeName);
                  },
                  child: Container(
                    width: 100,
                      height: 50,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      color: Colors.blue,
                      border: Border.all(color: Colors.blue)
                          ),
                      child:Center(child: Text("Done", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),))

                  ),
                )

              ],
            )
          ]
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            
            // Text("Skip"),
          Container ( alignment: Alignment(0, 0.75),
              
              child: SmoothPageIndicator(controller: _controller, count: 3)),
            // Text("Next")
          ],),
        ]
      )
    );
  }
}
