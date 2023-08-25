// import 'dart:html';
import 'dart:io';

import 'dart:math';
import 'dart:developer';
import 'package:assignment_flutter/neu_box.dart';
import 'package:assignment_flutter/provider/song_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:assignment_flutter/First.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:assignment_flutter/Settings.dart';
import 'package:provider/provider.dart';

import 'MusicTile.dart';

class Song extends StatefulWidget {
  const Song({Key? key}) : super(key: key);
  
  static String routeName  = '/song';

  @override
  State<Song> createState() => _SongState();
}

class _SongState extends State<Song> {
  final OnAudioQuery _audioQuery = new OnAudioQuery();
  final AudioPlayer _audioplayer = new AudioPlayer();

  List<SongModel> allSongs = [];

  void initState() {
    // Implement Init State
    super.initState();
    requestPermission();
  }
  requestPermission()async{
    if (Platform.isAndroid){
      bool permissionStatus = await _audioQuery.permissionsStatus();
      if(!permissionStatus){
        await _audioQuery.permissionsRequest();
      }
      setState(() {

      });
    }
  }
  @override





  // playsong(String? uri) {
  //   try{
  //     _audioplayer.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
  //     _audioplayer.play();
  //
  //   }on Exception{
  //     var log = ("Error Parsing Song");
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey[300],

          actions: [

            Row(

              children: [
                Icon(Icons.music_note,size: 50,color: Colors.purple,),
                SizedBox(width: 10,),
                Center(child: Text("P L A Y L I S T", style: TextStyle(color: Colors.black),)),
                SizedBox(width: 150,),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, settings.routeName);
                    },
                    child: Icon(Icons.search)),
                SizedBox(width: 10,),



            ]),
      ],
          ),





        body:



    FutureBuilder<List<SongModel>>(
              future: _audioQuery.querySongs(
                sortType: null,
                orderType: OrderType.ASC_OR_SMALLER,
                uriType: UriType.EXTERNAL,
                ignoreCase: true,
              ),
              builder: (context, item) {
                if(item.data == null){
                  return Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                }
                if(item.data!.isEmpty){
                  return Center(child: Text("No songs found"));
                }

                return Stack(
                  children: [
                    ListView.builder(
                      itemCount: item.data!.length,
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                      itemBuilder: (context, index) {
                        allSongs.addAll(item.data!);
                        return neuBox(
                          child: GestureDetector(
                            onTap: () {
                              context
                                  .read<SongModelProvider>()
                                  .setId(item.data![index].id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => First(
                                          songModelList: [item.data![index]],
                                          audioplayer: _audioplayer)));
                            },
                            child: MusicTile(
                              songModel: item.data![index],
                            ),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => First(
                                      songModelList: allSongs,
                                      audioplayer: _audioplayer)));
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 15, 15),
                          child: const CircleAvatar(
                            radius: 30,
                            child: Icon(
                              Icons.play_arrow,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
    ),
    );
  }
}