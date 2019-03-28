import 'package:flutter/material.dart';
import 'package:flutter_gallery/tabview/audio.dart';
import 'package:flutter_gallery/tabview/file.dart';
import 'package:flutter_gallery/tabview/video.dart';
import 'package:flutter_gallery/tabview/image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xffe67e22),
          title: Text(
            'Gallery',
            style: TextStyle(color: Colors.white, fontFamily: 'Bold'),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: EdgeInsets.only(bottom: 15),
            tabs: <Widget>[
              Text(
                'Images',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: 'Medium'),
              ),
              Text(
                'Videos',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: 'Medium'),
              ),
              Text(
                'Audios',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: 'Medium'),
              ),
              Text(
                'Files',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: 'Medium'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Images(),
            Video(),
            Audio(),
            File(),
          ],
        ),
      ),
    );
  }
}
