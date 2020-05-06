import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

const ASPECT_RATIO = 3 / 2;

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController controller;
  final String videoTitle;

  const VideoPlayerWidget({
    Key key,
    @required this.controller,
    @required this.videoTitle,
  })  : assert(controller != null),
        assert(videoTitle != null),
        super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  ChewieController _chewieController;
  @override
  void initState() {
    _chewieController = ChewieController(
      videoPlayerController: widget.controller,
      aspectRatio: ASPECT_RATIO,
      autoInitialize: true,
      autoPlay: true,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.purple,
        handleColor: Colors.purple,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.purple[100],
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Chewie(
          controller: _chewieController,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            widget.videoTitle,
            style: Theme.of(context).textTheme.title
                .copyWith(color: Color.fromRGBO(14, 26, 92, 1)),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}
