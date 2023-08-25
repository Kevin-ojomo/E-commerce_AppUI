import 'dart:math';

import 'package:assignment_flutter/Home.dart';
import 'package:assignment_flutter/provider/song_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:assignment_flutter/neu_box.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:assignment_flutter/MainHome.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:assignment_flutter/Default.dart';
import 'package:provider/provider.dart';
class First extends StatefulWidget {

  const First({Key? key, required this.audioplayer, required this.songModelList,}) : super(key: key);
  final List<SongModel> songModelList;
  final AudioPlayer audioplayer;
  static String routeName = "/first";

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {

  Duration _duration = Duration();
  Duration _position = Duration();

  bool _isPlaying = false;
  List<AudioSource> songList = [];

  int currentIndex = 0;



  void popBack(){
    Navigator.pop(context);
  }

  void ChangeToSeconds(int seconds){
    Duration duration = Duration(seconds: seconds);
    widget.audioplayer.seek(duration);
  }

  @override
  void initState() {
    super.initState();
    playSong();
  }

  void playSong() {
    try {
      for (var element in widget.songModelList) {
        songList.add(AudioSource.uri(Uri.parse(element.uri!),
          tag: MediaItem(
            // Specify a unique ID for each media item:
            id: element.id.toString(),
            // Metadata to display in the notification:
            album: element.album ?? "No Album",
            title: element.displayNameWOExt,
            artUri: Uri.parse(element.id.toString()),
          ),
        ));
      }
      widget.audioplayer.setAudioSource(
          ConcatenatingAudioSource(children: songList));
      widget.audioplayer.play();
      _isPlaying = true;

      widget.audioplayer.durationStream.listen((duration) {
        if (duration != null) {
          setState(() {
            _duration = duration;
          });
        }
      });
      widget.audioplayer.positionStream.listen((position) {
        setState(() {
          _position = position;
        });
      });
      listenToEvent();
      listenToSongIndex();
    } on Exception catch (_) {
      popBack();
    }
  }

  void listenToEvent(){
    widget.audioplayer.playerStateStream.listen((state) {
      if(state.playing){
        setState(() {
          _isPlaying = true;
        });
      }else{
        setState(() {
          _isPlaying = false;
        });
      }
      if (state.processingState == ProcessingState.completed){
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }
  void listenToSongIndex(){
    widget.audioplayer.currentIndexStream.listen((event) {
      setState(() {
        if (event != null){
          currentIndex = event;
        }
        context.read<SongModelProvider>().setId(widget.songModelList[currentIndex].id);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:



    ListView(children: <Widget>[
        // SingleChildScrollView(
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children:  [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Song.routeName);
                          },

                        child: neuBox(
                          child: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () { popBack(); },),

                        ),
                      ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text("P L A Y L I S T"),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: neuBox(
                          child: Icon(Icons.menu),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child: neuBox(
                      child: Column(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:  ArtWorkWidget()
                              
                            
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.songModelList[currentIndex].title,
                                      style: TextStyle(
                                          fontSize: 5.4,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("${widget.songModelList[currentIndex].artist}", style: TextStyle(fontSize: 15, color: Colors.grey),)

                                  ],
                                ),
                              ),
                              const SizedBox(width: 15,),
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,

                              ),

                            ],
                          ),

                        ),

                      ]),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_position.toString().split(".")[0]),
                          Icon(Icons.shuffle),

                          Icon(Icons.repeat,),
                          Text(_duration.toString().split(".")[0]
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  neuBox(child: Slider(
                    min: Duration(microseconds: 0).inSeconds.toDouble(),
                    value:_position.inSeconds.toDouble(),
                    max: _duration.inSeconds.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        ChangeToSeconds(value.toInt());
                        value = value;
                      });
                    },
                  )),
                  SizedBox(height: 20,),


                  SizedBox(
                    height: 80,
                    child: Row(
                      children:  [
                        Expanded(
                          child: neuBox(child: IconButton(
                            onPressed: () {
                              if(widget.audioplayer.hasNext){
                                widget.audioplayer.seekToNext();
                              }
                            },
                            icon: Icon(Icons.skip_previous),),),
                        ),
                      Expanded(
                        flex: 2,


                            child: neuBox(child: IconButton(icon: Icon(_isPlaying ? Icons.pause: Icons.play_arrow), onPressed: () {setState(() {
                              if(_isPlaying) {
                              widget.audioplayer.pause();
                              }else{
                                if(_position >= _duration){
                                  ChangeToSeconds(0);
                              } else{
                               widget.audioplayer.play();
                              }
                              _isPlaying = !_isPlaying;
                            }});},))),
                        Expanded(
                          child: neuBox(child: IconButton(
                            onPressed: () {
                              if(widget.audioplayer.hasPrevious){
                                widget.audioplayer.seekToPrevious();
                              }
                            },
                            icon: Icon(Icons.skip_next,),),
                        ),
                        ),
                    ]
                  ),
                          ),

            //
            //
            //   ],
         ] ),
        ),
            ),
      ]),
      bottomNavigationBar: Container(
        color: Colors.grey.shade500,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              backgroundColor: Colors.grey.shade500,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.black,
              padding: EdgeInsets.all(5),
              gap: 8,
              tabs:[GButton(icon: Icons.home,text: "Home",),
                GButton(icon: Icons.favorite, text: "Favorite"),
                GButton(icon: Icons.settings, text: "Settings "),
                GButton(icon: Icons.person, text: "Profile")


              ]
          ),
        ),
      ),

    );
  }
  // void ChangeToSeconds(int seconds){
  //   Duration duration = Duration(seconds: seconds);
  //   widget.audioplayer.seek(duration);
  // }
}

class ArtWorkWidget extends StatelessWidget {
  const ArtWorkWidget({
    Key? key,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      type: ArtworkType.AUDIO,
      id: context.watch<SongModelProvider>().id,
      nullArtworkWidget: Image.asset("assets/images/music.png"),
      size: 1000,
      artworkFit: BoxFit.cover,
      artworkHeight: 300.0,
      artworkWidth: 300.0,
    );
  }
}
