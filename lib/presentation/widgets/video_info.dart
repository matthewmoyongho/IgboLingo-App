import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:igbo_lang_tutor/core/constants.dart';
import 'package:igbo_lang_tutor/data/models/video.dart';
import 'package:igbo_lang_tutor/presentation/screens/questions_screen.dart';
import 'package:igbo_lang_tutor/presentation/widgets/video_tile.dart';
import 'package:video_player/video_player.dart';

import '../../domain/business_logic/blocs/video/video_bloc.dart';
import '../../domain/business_logic/blocs/video/video_state.dart';

class VideoInfo extends StatefulWidget {
  VideoInfo({Key? key, required this.category}) : super(key: key);

  String category;

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  bool playArea = false;
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  List<Video>? _videosList;

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
    _controller!.pause();

    _controller!.dispose();
    _controller = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: playArea
            ? BoxDecoration(color: kPrimaryColor)
            : BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    kPrimaryColor.withOpacity(
                      .9,
                    ),
                    kSecondaryColor
                  ],
                  begin: FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ),
              ),
        child: Column(
          children: [
            playArea
                ? Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    size: 20,
                                    color: kSecondaryColor,
                                  ),
                                ),
                                const Expanded(
                                  child: SizedBox(),
                                ),
                                const Icon(
                                  Icons.info_outline,
                                  size: 20,
                                  color: kSecondaryColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        _playView(context),
                        _controlView(context, _videosList!),
                      ],
                    ),
                  )
                : Container(
                    padding:
                        const EdgeInsets.only(top: 70, left: 30, right: 30),
                    width: double.infinity,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: kSecondaryColor,
                                )),
                            Expanded(child: SizedBox()),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: kSecondaryColor,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        FittedBox(
                          child: Text(
                            widget.category,
                            style: GoogleFonts.poppins(
                                fontSize: 25, color: kSecondaryColor),
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kPrimaryColor.withOpacity(0.4)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: kSecondaryColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '68 min',
                                    style: TextStyle(
                                        fontSize: 16, color: kSecondaryColor),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 200,
                              height: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kPrimaryColor.withOpacity(0.4)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: kSecondaryColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Resistent band, kettebel',
                                    style: TextStyle(
                                        fontSize: 16, color: kSecondaryColor),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30, left: 30, right: 30.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Circuit 1: Legs annd Toning',
                            style: GoogleFonts.poppins(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          Icon(
                            Icons.loop,
                            size: 30,
                            color: kPrimaryColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '3 sets',
                            style:
                                TextStyle(fontSize: 15, color: kPrimaryColor),
                          )
                        ],
                      ),
                      _videoList(),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => QuestionsScreen(category: widget.category),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(double.infinity, 40),
                  backgroundColor: kSecondaryColor,
                  foregroundColor: kPrimaryColor),
              child: const Text('Perform the quiz for this section'),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _controlView(BuildContext context, List<Video> videos) {
    return Container(
      height: 50,
      width: double.infinity,
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              final index = _isPlayingIndex - 1;
              if (index >= 0 && videos.length > 0) {
                _onTapVideo(index, videos);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('No more videos in this direction')));
              }
            },
            icon: const Icon(
              Icons.fast_rewind,
              size: 36,
              color: kSecondaryColor,
            ),
          ),
          IconButton(
            onPressed: () async {
              if (_isPlaying) {
                setState(() {
                  _isPlaying = false;
                });
                _controller!.pause();
              } else {
                setState(() {
                  _isPlaying = true;
                });
                _controller!.play();
              }
            },
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 36,
              color: kSecondaryColor,
            ),
          ),
          IconButton(
            onPressed: () async {
              final index = _isPlayingIndex + 1;
              if (index <= videos.length - 1) {
                _onTapVideo(index, videos);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('No more videos in this direction')));
              }
            },
            icon: const Icon(
              Icons.fast_forward,
              size: 36,
              color: kSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            'Loading video...',
            style: TextStyle(fontSize: 20, color: kSecondaryColor),
          ),
        ),
      );
    }
  }

  var _onUpdateControllerTime;
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      return;
    }
    if (!controller.value.isInitialized) {
      return;
    }
    final playing = controller.value.isPlaying;
    _isPlaying = playing;
  }

  _onTapVideo(int index, List<Video> videos) async {
    final controller = VideoPlayerController.networkUrl(
      Uri.parse(videos[index].mediaUrl),
    );
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old!.dispose();
        _isPlayingIndex = index;
        _controller!.addListener(_onControllerUpdate);
        setState(() {});
        controller.play();
      });
  }

  _videoList() {
    return Expanded(child: BlocBuilder<VideoBloc, VideoState>(
      builder: (context, state) {
        List<Video> videos = [];
        videos.addAll(
            state.videos.where((video) => video.category == widget.category));
        _videosList = videos;
        return ListView.builder(
            itemCount: videos.length,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  _onTapVideo(index, videos);
                  setState(() {
                    if (playArea == false) {
                      playArea = true;
                    }
                  });
                },
                child: VideoTIle(
                  videos: videos,
                  index: index,
                ),
              );
            });
      },
    ));
  }
}
