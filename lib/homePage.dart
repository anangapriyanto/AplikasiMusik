import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/database.dart';
import 'package:plant_app/musicPlayer.dart';
import 'package:plant_app/detail.dart';
import 'package:collection/collection.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

bool isSearch = false;
var abc = mostPopular.groupListsBy((ele) => ele.album);
var album = [];
var dump;
class _HomePageState extends State<HomePage> {
  List<Song> isi = mostPopular;
  void initState() {
    abc.forEach((x,y){      
      y.forEach((y){
        if(x == y.album){
          dump = y.img_album;
        }
      });
      album.add(
        {'album':x,'jumlah':y.length.toString(),'foto':dump}
      );
    });
    super.initState();
  }
  filter(x){
    setState((){
      isi = mostPopular.where(
            (elem) => elem.name.toString().toLowerCase().contains(
                  x.toLowerCase(),
                ),
          )
          .toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.grey[850],
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              if(isSearch == false){
                setState((){
                  isSearch = true;
                });
              }else{
                setState((){
                  isSearch = false;
                });
              }
            },
          ),
        title: isSearch ? _cari() : judul(),
        // actions: [
        //   Column(
        //     mainAxisSize: MainAxisSize.min,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Hello, Selemat Datang",
        //         style: TextStyle(fontWeight: FontWeight.bold),
        //       ),
        //       Text(
        //         "",
        //         style: TextStyle(fontSize: 10),
        //       )
        //     ],
        //   ),
        //   Padding(
        //     padding: EdgeInsets.only(right: 8, left: 15),
        //     child: Icon(
        //       Icons.notifications_active_outlined,
        //       size: 30,
        //     ),
        //   )
        // ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20,top: 5),
                  child: Text(
                    "Lagu Tradisional",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Suku Ketengban",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
                  child: Text(
                    "Lagu",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                Container(
                  height: 240,
                  child: TrackWidget(song: isi),
                ),
                CircleTrackWidget(
                  // song: newRelease,
                  title: "Album",
                  subtitle: "",
                  notifyParent: refresh,
                ),
                SizedBox(
                  height: 130,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  refresh() {
    setState(() {});
  }

  Widget _cari(){
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Search....',
            // suffixIcon: IconButton(
            //   onPressed: (){},
            //   icon: Icon(Icons.search),
            // ),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white,width: 0.0),
              borderRadius: const BorderRadius.all(
                const Radius.circular(30),
              ),
            ),
              focusedBorder: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(30.0),
                borderSide:  BorderSide(color: Colors.white ),
              ),
          ),
          onChanged: (content) {
            filter(content);
          },
        ),
      ],
    );
  }

  Widget judul(){
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hello, Selemat Datang",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

double currentSlider = 0;

class PlayerHome extends StatefulWidget {
  final Song song;
  PlayerHome(this.song);

  @override
  _PlayerHomeState createState() => _PlayerHomeState();
}

class _PlayerHomeState extends State<PlayerHome> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     PageRouteBuilder(
        //         pageBuilder: (context, _, __) => MusicPlayer(widget.song)));
      },
      child: Container(
        height: 130,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: "image",
                      child: CircleAvatar(
                        backgroundImage: AssetImage(widget.song.image),
                        radius: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.song.name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text(widget.song.singer,
                            style: TextStyle(
                              color: Colors.white54,
                            ))
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.pause, color: Colors.white, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.skip_next_outlined,
                        color: Colors.white, size: 30),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  Duration(seconds: currentSlider.toInt())
                      .toString()
                      .split('.')[0]
                      .substring(2),
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 120,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 4),
                      trackShape: RectangularSliderTrackShape(),
                      trackHeight: 4,
                    ),
                    child: Slider(
                      value: currentSlider,
                      max: widget.song.duration.toDouble(),
                      min: 0,
                      inactiveColor: Colors.grey[500],
                      activeColor: Colors.white,
                      onChanged: (val) {
                        setState(() {
                          currentSlider = val;
                        });
                      },
                    ),
                  ),
                ),
                Text(
                  Duration(seconds: widget.song.duration)
                      .toString()
                      .split('.')[0]
                      .substring(2),
                  style: TextStyle(color: Colors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TrackWidget extends StatelessWidget {
  final List<Song> song;
  TrackWidget(
      {required this.song});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: song.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context) => MusicPlayer(index)),
            );
          },
          child: Container(
              margin: EdgeInsets.fromLTRB(18, 0, 0, 0),
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                              song[index].image,
                              fit: BoxFit.cover,
                          ),
                        ),
                      ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song[index].name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Text(mostPopular[index].singer,
                            style: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                ],
              ),
              // decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     boxShadow: [
              //       BoxShadow(
              //           color: mostPopular[index].color,
              //           blurRadius: 1,
              //           spreadRadius: 0.3)
              //     ],
              //     image: DecorationImage(
              //         image: AssetImage(mostPopular[index].image),
              //         fit: BoxFit.cover)),
          ),
        );
      },
    );
  }
}

class CircleTrackWidget extends StatelessWidget {
  final String title;
  final List<Song> song = mostPopular;
  var song2 = mostPopular.groupListsBy((ele) => ele.album);
  var foto;
  var jumlah;
  final String subtitle;
  final Function() notifyParent;


  CircleTrackWidget(
      {required this.title,
      // required this.song,
      required this.subtitle,
      required this.notifyParent});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 210,
      width: MediaQuery.of(context).size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 0),
            child: Text(
              subtitle,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
         ListView.builder(
              itemCount: album.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    print(album);
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => AlbumList(album[index]['album'])),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(18,0,10,10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          // height: 60,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                                album[index]['foto'],
                                fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child:Text(
                                    album[index]['album'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                child: Text(
                                  album[index]['jumlah']+' lagu',
                                  style: TextStyle(color: Colors.white54),
                                )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          
        ],
      ),
    );
  }
}
