// import 'dart:js';



// import 'dart:js';



import 'package:assignment_flutter/First.dart';
import 'package:assignment_flutter/Settings.dart';
import 'package:assignment_flutter/SlideScreen.dart';
import 'package:assignment_flutter/Splash.dart';
import 'package:flutter/material.dart';
import 'package:assignment_flutter/Home.dart';
import 'package:assignment_flutter/Second.dart';
import 'package:assignment_flutter/MainHome.dart';
import 'package:assignment_flutter/Default.dart';
import 'package:on_audio_query/on_audio_query.dart';


final Map<String, WidgetBuilder> routes = {
  splash.routeName:(context) => splash(),
  Home.routeName: (context) => Home(),
  // First.routeName: (context) => First(songModel: item.data![index],),
  Second.routeName: (context) => Second(),
  Main.routeName: (context) => Main(),
  Song.routeName: (context) => Song(),
  settings.routeName: (context) => settings(),
  Slide.routeName: (context) => Slide(),
  

};
