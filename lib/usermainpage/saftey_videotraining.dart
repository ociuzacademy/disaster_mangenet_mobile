import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SafetyVideoTraining extends StatefulWidget {
  const SafetyVideoTraining({super.key});

  @override
  _SafetyVideoTrainingState createState() => _SafetyVideoTrainingState();
}

class _SafetyVideoTrainingState extends State<SafetyVideoTraining> {
  late List<YoutubePlayerController> _controllers;

  final List<Map<String, String>> _videos = [
    {"title": "Training Video 1", "url": "https://youtu.be/GVBamXXVD30"},
    {"title": "Training Video 2", "url": "https://youtu.be/UbLEO_cgEGg"},
    {"title": "Training Video 3", "url": "https://youtu.be/uMpZee9-n10"},
    {"title": "Training Video 4", "url": "https://youtu.be/Vc7ZqtGNmTY"},
  ];

  String extractVideoId(String url) {
    Uri uri = Uri.parse(url);
    if (uri.host.contains("youtu.be")) {
      return uri.pathSegments.first;
    } else if (uri.host.contains("youtube.com") && uri.queryParameters.containsKey("v")) {
      return uri.queryParameters["v"]!;
    }
    throw Exception("Invalid YouTube URL: $url");
  }

  @override
  void initState() {
    super.initState();
    _controllers = _videos.map((video) {
      final videoId = extractVideoId(video["url"]!);
      return YoutubePlayerController.fromVideoId(
        videoId: videoId,
        autoPlay: false,
        params: const YoutubePlayerParams(
          showFullscreenButton: true,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help Video Training')),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _controllers.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _videos[index]["title"]!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                child: YoutubePlayer(
                  controller: _controllers[index],
                  aspectRatio: 16 / 9,
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}