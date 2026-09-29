import 'package:disaster_management/modules/wether_prediction/wether_predict.dart';
import 'package:flutter/material.dart';
//import 'package:home_ease/view/ai_preediction_screen/Prediction_screen.dart';

class AiAvatarButton extends StatefulWidget {
  const AiAvatarButton({super.key});

  @override
  State<AiAvatarButton> createState() => _AiAvatarButtonState();
}

class _AiAvatarButtonState extends State<AiAvatarButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  WeatherPredictionPage(),
          ),
        );
      },
      padding: EdgeInsets.zero,
      icon: SizedBox(
        width: 45,
        height: 45,
        child: Stack(
          alignment: Alignment.center,
          children: [

            // 🌈 Animated gradient ring
            RotationTransition(
              turns: _controller,
              child: Container(
                width: 42,
                height: 42,
                padding: const EdgeInsets.all(2.5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: SweepGradient(
                    colors: [
                      Color(0xFFFF6B00),
                      Color(0xFFFFD600),
                      Color(0xFFFF0069),
                      Color(0xFFB000FF),
                      Color(0xFF00C6FF),
                      Color(0xFFFF6B00),
                    ],
                  ),
                ),
              ),
            ),

            // 🤖 Center circle
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF8FA8DD),
              ),
              child: const Icon(
                Icons.smart_toy_outlined,
                color: Colors.white,
                size: 23,
              ),
            ),
          ],
        ),
      ),
    );
  }
}