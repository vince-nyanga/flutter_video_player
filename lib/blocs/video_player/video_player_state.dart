import 'package:equatable/equatable.dart';
import 'package:video_player/video_player.dart';

import '../../models/models.dart';

abstract class VideoPlayerState extends Equatable {
  @override
  List<Object> get props => const [];
}

class VideoPlayerStateInitial extends VideoPlayerState {
  @override
  List<Object> get props => const [];
}

class VideoPlayerStateLoading extends VideoPlayerState {}

class VideoPlayerStateError extends VideoPlayerState {
  final String message;

  VideoPlayerStateError(this.message);

  @override
  List<Object> get props => [message];
}

class VideoPlayerStateLoaded extends VideoPlayerState {
  final Video video;
  final VideoPlayerController controller;

  VideoPlayerStateLoaded(this.video, this.controller)
      : assert(video != null),
        assert(controller != null);

  @override
  List<Object> get props => [video, controller];
}
