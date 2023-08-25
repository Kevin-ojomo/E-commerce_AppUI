import 'package:assignment_flutter/neu_box.dart';
import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);
  static String routeName = "/settings";

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        actions: [

        Row(

        children: [
        Icon(Icons.music_note,size: 50,color: Colors.purple,),
    SizedBox(width: 80,),
    Center(child: Text("S E T T I N G S", style: TextStyle(color: Colors.black),)),
    SizedBox(width: 130,),



    ]),
    ]
    ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            neuBox(child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Equalizer", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),

                ],),

            ],
            ),

            ),
            neuBox(child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Timer", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),

                ],),

            ],
            ),

            ),
            neuBox(child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Audio Quality", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),

                ],),

            ],
            ),

            ),
            neuBox(child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("Check for Updates ", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

                      ),
                      SizedBox(width: 10,),
                      Text("v.6.50", style: TextStyle(color: Colors.grey),)
                    ],
                  ),


                ],),

            ],
            ),

            ),
            SizedBox(height: 20,),
            Text("G E N E R A L  S E T T I N G S"),
            neuBox(child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Language", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),

                ],),

            ],
            ),

            ),
            neuBox(child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Help", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),

                ],),

            ],
            ),

            ),
            neuBox(child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Theme", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),

                ],),

            ],
            ),

            ),
            neuBox(child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("About", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                  ),

                ],),

            ],
            ),

            ),








          ],
        ),
      ),
    );
  }
}
