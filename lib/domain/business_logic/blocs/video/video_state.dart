import 'package:equatable/equatable.dart';
import 'package:igbo_lang_tutor/data/models/video.dart';

class VideoState extends Equatable {
  final List<Video> videos;

  VideoState({required this.videos});

  @override
  // TODO: implement props
  List<Object?> get props => [videos];
}

class VideosLoading extends VideoState {
  VideosLoading() : super(videos: []);
}

class VideosLoaded extends VideoState {
  @override
  final List<Video> videos;
  VideosLoaded({required this.videos}) : super(videos: []);

  @override
  // TODO: implement props
  List<Object?> get props => [videos];
}
