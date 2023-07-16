import 'package:film/future/theme/mytheme.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class izlePage extends StatefulWidget {
  String id;
  bool live;
  izlePage({super.key, required this.id, required this.live});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state.
  @override
  _izlePageState createState() => _izlePageState();
}

class _izlePageState extends State<izlePage> {
  // ignore: unused_field
  YoutubePlayerController? controller;
  @override
  void initState() {
    controller = YoutubePlayerController(
        initialVideoId: widget.id,
        flags: YoutubePlayerFlags(
            isLive: widget.live,
            autoPlay: true,
            enableCaption: true,
            captionLanguage: 'tr'));

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: MyTheme.black,
      body: Center(
          child: Stack(alignment: Alignment.topRight, children: [
        YoutubePlayer(
          controller: controller!,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.white,
          bottomActions: [
            CurrentPosition(),
            ProgressBar(
              isExpanded: true,
              colors: ProgressBarColors(
                  playedColor: Colors.red,
                  handleColor: Colors.red,
                  backgroundColor: Colors.white),
            ),
            RemainingDuration(
              controller: controller,
            ),
            PlaybackSpeedButton(
              icon: Icon(Icons.speed_sharp, color: MyTheme.white),
            ),
            FullScreenButton()
          ],
          onReady: () {},
          onEnded: (YoutubeMetaData metaData) {
            controller!.seekTo(Duration(seconds: 0));
          },
        ),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: MyTheme.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ])),
    );
  }
}
