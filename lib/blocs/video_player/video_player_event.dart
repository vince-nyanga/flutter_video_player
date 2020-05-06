import 'package:equatable/equatable.dart';

import '../../models/models.dart';

abstract class VideoPlayerEvent extends Equatable{
  @override
  List<Object> get props => const [];
}

class VideoSelectedEvent extends VideoPlayerEvent{
  final Video video;

  VideoSelectedEvent(this.video) : assert(video != null);

  @override
  List<Object> get props => [video];
}