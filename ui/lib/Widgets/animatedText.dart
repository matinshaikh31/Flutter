import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedtextWidget extends StatelessWidget {
  const AnimatedtextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated text"),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText("MatinShaikh",
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  speed: Duration(milliseconds: 200))
            ],
            totalRepeatCount: 4,
            pause: Duration(milliseconds: 4),
            displayFullTextOnTap: true,
          ),
          AnimatedTextKit(
            animatedTexts: [
              RotateAnimatedText(
                'HELLO',
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
              ),
              RotateAnimatedText(
                'BEAUTIFUL',
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.red),
              ),
              RotateAnimatedText(
                'WORLD',
                textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
            // totalRepeatCount: 4,
            // pause: Duration(milliseconds: 200),
            // displayFullTextOnTap: true,
            // stopPauseOnTap: true,
          ),
        ],
      ),
    );
  }
}
