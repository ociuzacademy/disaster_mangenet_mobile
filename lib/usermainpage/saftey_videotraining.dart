// usermainpage/saftey_videotraining.dart
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class SafteyVideotraining extends StatefulWidget {
  const SafteyVideotraining({super.key});

  @override
  _SafteyVideotrainingState createState() => _SafteyVideotrainingState();
}

class _SafteyVideotrainingState extends State<SafteyVideotraining> {
  late List<YoutubePlayerController> _controllers;
  final List<String> _videoTitles = [
    "Training Video 1",
    "Training Video 2",
    "Training Video 3",
    "Training Video 4",
  ];

  @override
  void initState() {
    super.initState();
    _controllers = [
      YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId('https://youtu.be/GVBamXXVD30?si=z372HWYAIIR8u1eh')!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          loop: false,
        ),
      ),
      YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId('https://youtu.be/UbLEO_cgEGg?si=B3dldJu5X0QrGP4j')!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          loop: false,
        ),
      ),
      YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId('https://youtu.be/uMpZee9-n10?si=OGcY_pG2Yoe6oRqf')!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          loop: false,
        ),
      ),
      YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId('https://youtu.be/Vc7ZqtGNmTY?si=rR4UkPg45d2qjntZ')!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          loop: false,
        ),
      ),
    ];
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _playVideo(int index) {
    _controllers[index].play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Video Training'),
      ),
      body: ListView.builder(
        itemCount: _controllers.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    _videoTitles[index],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        YoutubePlayer(
                          controller: _controllers[index],
                          showVideoProgressIndicator: false,
                        ),
                        ElevatedButton(
                          onPressed: () => _playVideo(index),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(20),
                            backgroundColor: Colors.white.withOpacity(0.7), // Button color
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            size: 48,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
