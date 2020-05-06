import 'package:meta/meta.dart';

class Video {
  final String title;
  final String url;

  Video({
    @required this.title,
    @required this.url,
  })  : assert(title != null),
        assert(url != null);
}
