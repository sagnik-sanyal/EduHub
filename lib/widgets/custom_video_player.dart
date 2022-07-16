import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomVideoPlayer extends StatefulWidget {
  final String videoId;
  final Duration startAt;
  final Duration endAt;
  const CustomVideoPlayer({
    Key? key,
    required this.videoId, required this.startAt, required this.endAt,
  }) : super(key: key);

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = YoutubePlayerController(
        params: YoutubePlayerParams(
          showControls: true,
          mute: false,
          startAt: widget.startAt,
          enableKeyboard: false,
          endAt: widget.endAt,
          autoPlay: false,
          loop: false,
          showFullscreenButton: true,
          desktopMode: false,
          privacyEnhanced: true,
          useHybridComposition: true,
        ),
        initialVideoId: widget.videoId);

    controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };
    controller.onExitFullscreen = () {};
  }

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  var aspectRatio = 16 / 9;
  @override
  Widget build(BuildContext context) {
    return YoutubeValueBuilder(
      controller: controller,
      builder: (context, value) {
        return AnimatedCrossFade(
          firstChild: SizedBox(
            height: ScreenUtil().setHeight(100),
            width: double.maxFinite,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          secondChild: AspectRatio(
            aspectRatio: aspectRatio,
            child: ytFrame(controller),
          ),
          crossFadeState: value.isReady
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 500),
        );
      },
    );
  }

  Widget ytFrame(YoutubePlayerController controller) {
    return YoutubePlayerIFrame(
      controller: controller,
    );
  }
}

// Stack(
//                   children: [
//                     player,
//                     Positioned.fill(
//                       child: YoutubeValueBuilder(
//                         controller: _controller,
//                         builder: (context, value) {
//                           return AnimatedCrossFade(
//                             firstChild: const SizedBox.shrink(),
//                             secondChild: Material(
//                               child: DecoratedBox(
//                                 decoration: BoxDecoration(
//                                   image: DecorationImage(
//                                     image: NetworkImage(
//                                       YoutubePlayerController.getThumbnail(
//                                         videoId:
//                                             _controller.params.playlist.first,
//                                         quality: ThumbnailQuality.medium,
//                                       ),
//                                     ),
//                                     fit: BoxFit.fitWidth,
//                                   ),
//                                 ),
//                                 child: const Center(
//                                   child: CircularProgressIndicator(),
//                                 ),
//                               ),
//                             ),
//                             crossFadeState: value.isReady
//                                 ? CrossFadeState.showFirst
//                                 : CrossFadeState.showSecond,
//                             duration: const Duration(milliseconds: 300),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),