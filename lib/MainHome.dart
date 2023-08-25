import 'package:assignment_flutter/neu_box.dart';
import 'package:flutter/material.dart';
import 'package:assignment_flutter/First.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);
  static String routeName  = '/main';

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child:
                Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Icon(Icons.music_note, size: 50,),
                          Text("P L A Y L I S T"),

                          Container(child: Row(children: [
                            Icon(Icons.person),
                            SizedBox(width: 20,),
                            Icon(Icons.settings),
                          ],)
                          ),
                        ],
                      ),


                      Expanded(child:
                      SingleChildScrollView(scrollDirection: Axis.vertical,child:

                      Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, First.routeName);
                              },
                              child:
                              neuBox(child: Row(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset('assets/images/music.png', scale: 9.0,),

                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("R U M B###", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                    Text("Sarah Curniccle", style: TextStyle(fontSize: 15, color: Colors.grey),)
                                  ],),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Icon(Icons.play_arrow,size: 50, ),
                                ),
                              ],
                              ),

                              ),),






                            Column(
                                children: [
                                  neuBox(child: Row(children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset('assets/images/music.png', scale: 9.0,),

                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Tomorrow's Loss", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                        Text("Emilee", style: TextStyle(fontSize: 15, color: Colors.grey),)
                                      ],),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Icon(Icons.play_arrow,size: 50, ),
                                    ),
                                  ],
                                  ),

                                  ),


                                  Column(
                                      children: [
                                        neuBox(child: Row(children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12),
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset('assets/images/music.png', scale: 9.0,),

                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Africa", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                              Text("Dannyx", style: TextStyle(fontSize: 15, color: Colors.grey),)
                                            ],),
                                          Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Icon(Icons.play_arrow,size: 50, ),
                                          ),
                                        ],
                                        ),

                                        ),

                                        Column(
                                            children: [
                                              neuBox(child: Row(children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(12),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Image.asset('assets/images/music.png', scale: 9.0,),

                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("My Religion", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                    Text("Sarah Hensbrow", style: TextStyle(fontSize: 15, color: Colors.grey),)
                                                  ],),
                                                Padding(
                                                  padding: const EdgeInsets.all(20.0),
                                                  child: Icon(Icons.play_arrow,size: 50, ),
                                                ),
                                              ],
                                              ),

                                              ),

                                              Column(
                                                  children: [
                                                    neuBox(child: Row(children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(12),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Image.asset('assets/images/music.png', scale: 9.0,),

                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text("Codedly", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                          Text("Nathaniel Smity", style: TextStyle(fontSize: 15, color: Colors.grey),)
                                                        ],),
                                                      Padding(
                                                        padding: const EdgeInsets.all(20.0),
                                                        child: Icon(Icons.play_arrow,size: 50, ),
                                                      ),
                                                    ],
                                                    ),

                                                    ),
                                                    Column(
                                                        children: [
                                                          neuBox(child: Row(children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(12),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Image.asset('assets/images/music.png', scale: 9.0,),

                                                              ),
                                                            ),
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("Beautiful", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                Text("RT", style: TextStyle(fontSize: 15, color: Colors.grey),)
                                                              ],),
                                                            Padding(
                                                              padding: const EdgeInsets.all(20.0),
                                                              child: Icon(Icons.play_arrow,size: 50, ),
                                                            ),
                                                          ],
                                                          ),

                                                          ),

                                                          Column(
                                                              children: [
                                                                neuBox(child: Row(children: [
                                                                  ClipRRect(
                                                                    borderRadius: BorderRadius.circular(12),
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.all(8.0),
                                                                      child: Image.asset('assets/images/music.png', scale: 9.0,),

                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text("Dark Room", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                      Text("Jaminson Gay", style: TextStyle(fontSize: 15, color: Colors.grey),)
                                                                    ],),
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(20.0),
                                                                    child: Icon(Icons.play_arrow,size: 50, ),
                                                                  ),
                                                                ],
                                                                ),

                                                                ),

                                                                Column(
                                                                    children: [
                                                                      neuBox(child: Row(children: [
                                                                        ClipRRect(
                                                                          borderRadius: BorderRadius.circular(12),
                                                                          child: Padding(
                                                                            padding: const EdgeInsets.all(8.0),
                                                                            child: Image.asset('assets/images/music.png', scale: 9.0,),

                                                                          ),
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("Life", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                                                                            Text("Jennifer Days", style: TextStyle(fontSize: 15, color: Colors.grey),)
                                                                          ],),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(20.0),
                                                                          child: Icon(Icons.play_arrow,size: 50, ),
                                                                        ),
                                                                      ],
                                                                      ),

                                                                      ),

                                                                    ]),





                                                              ]),
                                                        ]),
                                                  ]),

                                            ]),
                                      ]),




                                ]),

                          ]),



                      )
                      )




                    ] )
            )
        )
    );

//     ),
//     ),
//
//       ),
// ),
//     ),
// ),
//     ]
// ),
//     ),
//       ),
//     );
  }
}
