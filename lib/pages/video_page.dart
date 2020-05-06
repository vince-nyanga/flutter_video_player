import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_video_player/services/services.dart';

import '../blocs/blocs.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class VideoPage extends StatelessWidget {
  final Video video;

  const VideoPage({Key key, @required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildVideoPlayer(),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return BlocProvider<VideoPlayerBloc>(
      create: (context) =>
          VideoPlayerBloc(RepositoryProvider.of<VideoControllerService>(context))..add(VideoSelectedEvent(video)),
      child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
        builder: (context, state){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _getPlayer(context, state)
            ],
          );
        },
      ),
    );
  }

  Widget _getPlayer(BuildContext context, VideoPlayerState state) {
    if (state is VideoPlayerStateLoaded) {
      return VideoPlayerWidget(
        key: Key(state.video.url),
        videoTitle: state.video.title,
        controller: state.controller,
      );
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final containerHeight = screenWidth / ASPECT_RATIO;

    if (state is VideoPlayerStateError){
      return Container(
        height: containerHeight,
        color: Colors.grey,
        child: Center(
          child: Text(state.message),
        ),
      );
    }

    return Container(
      height: containerHeight,
      color: Colors.grey,
      child: Center(
        child: Text('Initialising video...'),
      ),
    );
  }
}
