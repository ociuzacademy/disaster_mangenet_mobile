import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class SafetyVideoPage extends StatefulWidget {
  final String title;
  final List<Map<String, String>> videos;

  const SafetyVideoPage({super.key, required this.title, required this.videos});

  @override
  _SafetyVideoPageState createState() => _SafetyVideoPageState();
}

class _SafetyVideoPageState extends State<SafetyVideoPage> {
  late List<YoutubePlayerController> _controllers;

  String extractVideoId(String url) {
    Uri uri = Uri.parse(url);
    if (uri.host.contains("youtu.be")) {
      return uri.pathSegments.first;
    } else if (uri.host.contains("youtube.com") &&
        uri.queryParameters.containsKey("v")) {
      return uri.queryParameters["v"]!;
    }
    throw Exception("Invalid YouTube URL: $url");
  }

  @override
  void initState() {
    super.initState();
    _controllers = widget.videos.map((video) {
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
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _controllers.length,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.videos[index]["title"]!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
