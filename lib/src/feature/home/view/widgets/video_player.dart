import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PortraitVideoPlayer extends StatefulWidget {
  const PortraitVideoPlayer({super.key, required this.networkUrl});

  final String networkUrl;

  @override
  _PortraitVideoPlayerState createState() => _PortraitVideoPlayerState();
}

class _PortraitVideoPlayerState extends State<PortraitVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.networkUrl))
      ..initialize().then((_) {
        // Ensure aspect ratio is maintained
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio, // Maintain aspect ratio
          child: VideoPlayer(_controller),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
