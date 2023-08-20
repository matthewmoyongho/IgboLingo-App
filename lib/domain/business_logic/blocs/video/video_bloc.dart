import 'package:bloc/bloc.dart';
import 'package:igbo_lang_tutor/data/models/video.dart';
import 'package:igbo_lang_tutor/data/repositories/lecture_repository.dart';

import 'video_event.dart';
import 'video_state.dart';

class VideoBloc extends Bloc<VideosEvent, VideoState> {
  final LectureRepository _videoRepository;
  VideoBloc({required LectureRepository videoRepository})
      : _videoRepository = videoRepository,
        super(VideoState(videos: [])) {
    on<LoadVideos>(_loadVideos);
  }

  void _loadVideos(LoadVideos event, Emitter<VideoState> emit) async {
    emit(VideosLoading());
    List<Video> videos = [];
    videos.addAll(await _videoRepository.getAllVideos());
    emit(
      VideosLoaded(videos: videos),
    );
  }
}
