import 'package:bloc/bloc.dart';
import 'video_player.dart';
import '../../services/services.dart';

class VideoPlayerBloc extends Bloc<VideoPlayerEvent, VideoPlayerState> {
  final VideoControllerService _videoControllerService;

  VideoPlayerBloc(this._videoControllerService) : assert(_videoControllerService != null);

  @override
  VideoPlayerState get initialState => VideoPlayerStateInitial();

  @override
  Stream<VideoPlayerState> mapEventToState(VideoPlayerEvent event) async* {
    if (event is VideoSelectedEvent) {
      yield VideoPlayerStateLoading();
      try {
        final videoController = await _videoControllerService.getControllerForVideo(event.video);
        yield VideoPlayerStateLoaded(event.video, videoController);
      } catch (e) {
        yield VideoPlayerStateError(e.message ?? 'An unknown error occurred');
      }
    }
  }
}
