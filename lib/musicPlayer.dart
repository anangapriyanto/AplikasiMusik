import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/database.dart';
import 'package:plant_app/homePage.dart'; 
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';

class MusicPlayer extends StatefulWidget {
  // final Song song;
  final int index;
  MusicPlayer(this.index);

  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer>
  with SingleTickerProviderStateMixin {
  late AnimationController
      iconController;
  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;
  var lagu;
  
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  @override
  void initState() {
    lagu = mostPopular[widget.index];
    // TODO: implement initState
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    audioPlayer.open(Audio(lagu.file),autoStart: false,showNotification: true);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "image",
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(lagu.image), fit: BoxFit.cover)),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      "Music Player",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Text("", style: TextStyle(fontSize: 10))
                ],
              ),
              // Padding(
              //   padding: EdgeInsets.only(right: 8, left: 15),
              //   child: Icon(Icons.notifications_active_outlined, size: 30),
              // )
            ],
          ),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: ExpandableBottomSheet(
              background: Container(
                height: MediaQuery.of(context).size.height * 1,
                margin: EdgeInsets.only(bottom: 50, left: 20, right: 20),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 14,
                    spreadRadius: 16,
                    color: Colors.black.withOpacity(0.2),
                  )
                ]),
                child: Column(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                width: 1.5, color: Colors.white.withOpacity(0.2))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 20, right: 20, top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(child:
                                    Text(
                                      lagu.name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          // fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                lagu.singer,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(child: Icon(CupertinoIcons.backward_end_fill, color: Colors.white),onTap: (){
                                  // audioPlayer.seekBy(Duration(seconds: -10));
                                  if(widget.index <= 0){
                                    Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => MusicPlayer(mostPopular.length-1)),
                                    );
                                  }else{
                                    Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => MusicPlayer(widget.index - 1)),
                                    );
                                  }
                                },),
                                InkWell(child: Icon(CupertinoIcons.backward_fill, color: Colors.white),onTap: (){
                                  audioPlayer.seekBy(Duration(seconds: -10));
                                },),
                                GestureDetector(
                                  onTap: () {
                                    print(widget.index);
                                    AnimateIcon();
                                  },
                                  child: AnimatedIcon(
                                    icon: AnimatedIcons.play_pause,
                                    progress: iconController,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                ),
                                InkWell(child: Icon(CupertinoIcons.forward_fill, color: Colors.white),onTap: (){
                                  audioPlayer.seekBy(Duration(seconds: 10));
                                  // audioPlayer.next();
                                },),
                                InkWell(child: Icon(CupertinoIcons.forward_end_fill, color: Colors.white),onTap: (){
                                  // audioPlayer.seekBy(Duration(seconds: -10));
                                  if(widget.index+1 >= mostPopular.length){
                                    Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => MusicPlayer(0)),
                                    );
                                  }else{
                                    Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => MusicPlayer(widget.index + 1)),
                                    );
                                  }
                                },),
                              ],
                            ),
                            audioPlayer.builderCurrent(
                              builder: (context, Playing? playing) {
                            return Column(
                              children: <Widget>[
                                audioPlayer.builderRealtimePlayingInfos(
                                    builder: (context, RealtimePlayingInfos? infos) {
                                  if (infos == null) {
                                    return SizedBox();
                                  }
                                  return Column(
                                    children: [
                                      Slider(
                                        value: infos.currentPosition.inSeconds.toDouble(),
                                        min: 0,
                                        max: infos.duration.inSeconds.toDouble(),
                                        label: infos.currentPosition.toString().split('.')[0],
                                        onChanged: (double value){
                                          audioPlayer.seek(Duration(seconds: value.round()));
                                          print(value);
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            infos.currentPosition.toString().split('.')[0],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            ' / ',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(
                                            infos.duration.toString().split('.')[0],
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                              ],
                            );
                          }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   height: MediaQuery.of(context).size.height *0.3,
                  //   decoration: BoxDecoration(
                  //           color: Colors.white.withOpacity(0.2),
                  //           borderRadius: BorderRadius.circular(16),
                  //           border: Border.all(
                  //     width: 1.5, color: Colors.white.withOpacity(0.2))
                  //   ),
                  //   child:ListView.builder(
                  //     itemCount: mostPopular.length,
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return GestureDetector(
                  //         onTap: () {
                  //           audioPlayer.stop();
                  //           Navigator.push(
                  //             context, MaterialPageRoute(builder: (context) => MusicPlayer(index)),
                  //           );
                  //         },
                  //         child: Container(
                  //             margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
                  //             width: 200,
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Container(
                  //                   height: 100,
                  //                   child: Padding(
                  //                     padding: EdgeInsets.all(0),
                  //                       child: ClipRRect(
                  //                         borderRadius: BorderRadius.circular(8.0),
                  //                         child: Image.asset(
                  //                             mostPopular[index].image,
                  //                             fit: BoxFit.cover,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                 ),
                  //                 Container(
                  //                   child: Padding(
                  //                     padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                  //                     child: Column(
                  //                       mainAxisAlignment: MainAxisAlignment.end,
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text(
                  //                           mostPopular[index].name,
                  //                           style: TextStyle(
                  //                             color: Colors.white,
                  //                             fontSize: 12,
                  //                           ),
                  //                         ),
                  //                         Text(mostPopular[index].singer,
                  //                           style: TextStyle(
                  //                             color: Colors.white54,
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 10),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 ),
                                  
                  //               ],
                  //             ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],)
              ),
              persistentHeader: Container(
                height: 40,
                child: Center(
                  child: Text('Lyrics'),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)
                  ),
                  color: Colors.grey[500],
                ),
              ),
              expandableContent: Container(
                height: MediaQuery.of(context).size.height * 0.75,
                color: Colors.white,
                child: Center(
                  // child: Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.only(top: 20)),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 10),
                            //   child: Text(
                            //     'Arti :',
                            //     textAlign: TextAlign.left,
                            //     style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.bold
                            //       ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 10),
                            //   child: Text(
                            //     'Isi',
                            //     textAlign: TextAlign.justify,
                            //     style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 16,
                            //       ),
                            //   ),
                            // ),
                            // Padding(padding: const EdgeInsets.only(top: 10)),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 10),
                            //   child: Text(
                            //     'Terjemahan :',
                            //     textAlign: TextAlign.right,
                            //     style: TextStyle(
                            //         color: Colors.black,
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.bold
                            //       ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20,0,20,0),
                              child: Text(
                                lagu.lyric,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: MediaQuery.of(context).size.width * 0.06,
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  // ),
                ),
              ),
            ),
            
          ),
        ),
      ],
    );
  }

  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;
     if(isAnimated)
       {
         iconController.forward();
         audioPlayer.play();
       }else{
       iconController.reverse();
       audioPlayer.pause();
     }
    });
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    iconController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }
}

