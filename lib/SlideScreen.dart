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
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [ PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
        },
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
                Container(
                  width: 370,
                    height: 30,
                    child:Text("Done", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
                )

              ],
            )
          ]
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            
            GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Text("Skip")),
          Container ( alignment: Alignment(0, 0.75),
              
              child: SmoothPageIndicator(controller: _controller, count: 3)),
            onLastPage ?
            GestureDetector(
              onTap: () {
                _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
              },
                child: Text("Done")):GestureDetector(
                onTap: () {
                  _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                },
                child: Text("Next"))
          ],),
        ]
      )
    );
  }
}
