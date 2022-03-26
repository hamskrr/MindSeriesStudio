import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MSVideoPlayer extends StatefulWidget {
  final String video;
  const MSVideoPlayer({required this.video,Key? key}) : super(key: key);

  @override
  _MSVideoPlayerState createState() => _MSVideoPlayerState();
}

class _MSVideoPlayerState extends State<MSVideoPlayer> {

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.video)
      ..initialize().then((_) {
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
        alignment: Alignment.center,
        fit: BoxFit.cover,
        child: SizedBox(
            width:_controller.value.size.width,
            height:_controller.value.size.height,
            child: Center(
              child: _controller.value.isInitialized

            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        )
            : Container(),
      ),
    )));
  }
}
