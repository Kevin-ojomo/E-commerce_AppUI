// import 'dart:js';

import 'package:assignment_flutter/Settings.dart';
import 'package:assignment_flutter/SlideScreen.dart';
import 'package:assignment_flutter/Splash.dart';
import 'package:assignment_flutter/provider/song_model_provider.dart';
import 'package:assignment_flutter/routs.dart';
import 'package:flutter/material.dart';
import 'package:assignment_flutter/First.dart';
import 'package:assignment_flutter/MainHome.dart';
import 'package:assignment_flutter/Default.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(ChangeNotifierProvider(create: (context) => SongModelProvider(),
  child: const MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute:Song.routeName,
      routes: routes,
   
    );
  }
}
