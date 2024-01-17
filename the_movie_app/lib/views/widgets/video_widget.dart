import 'package:pod_player/pod_player.dart';
import 'package:flutter/material.dart';

import '../../model/video.dart';

class PlayVideoFromYoutube extends StatefulWidget {
  final Video video;
  const PlayVideoFromYoutube({Key? key,required this.video}) : super(key: key);

  @override
  State<PlayVideoFromYoutube> createState() => _PlayVideoFromYoutubeState();
}

class _PlayVideoFromYoutubeState extends State<PlayVideoFromYoutube> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube('https://youtu.be/${widget.video.key}'),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(controller: controller);
  }
}