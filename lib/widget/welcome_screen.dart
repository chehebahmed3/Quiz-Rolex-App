import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolexapp/widget/animated-image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.switchScreen, {super.key});
  final void Function() switchScreen;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const AnimatedImage(),
          const SizedBox(
            height: 90,
          ),
          Text(
            '-Rolex Catalog Quiz',
            style: GoogleFonts.abel(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton.icon(
            onPressed: switchScreen,
            icon: const Icon(Icons.arrow_circle_right),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 169, 154, 19),
            ),
            label: const Text(
              'click to quiz',
            ),
          )
        ],
      ),
    );
  }
}
