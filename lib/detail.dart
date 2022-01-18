import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/database.dart';
import 'package:plant_app/musicPlayer.dart';

class AlbumList extends StatefulWidget {
  final String song;
  AlbumList(this.song);

  @override
  _AlbumListState createState() => _AlbumListState();
}
var jumlah;
class _AlbumListState extends State<AlbumList>{
  
  List<Song> isi = mostPopular;
  void initState() {
    isi = mostPopular.where(
            (elem) => elem.album.toString().toLowerCase().contains(
                  widget.song.toLowerCase(),
                ),
          )
          .toList();
    jumlah = isi.length;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            brightness: Brightness.dark,
            backgroundColor: Colors.grey[850],
            elevation: 0,
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "List Album",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 8, left: 0),
              )
            ],
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
                        "Album "+widget.song,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "$jumlah Lagu",
                        style: TextStyle(
                            fontSize: 13,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListView.builder(
                      itemCount: isi.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context, MaterialPageRoute(builder: (context) => MusicPlayer(index)),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(18,0,10,10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                        isi[index].image,
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
                                        child: Text(
                                          isi[index].name,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                                        child: Text(
                                          isi[index].singer,
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}