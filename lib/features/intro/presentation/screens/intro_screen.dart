import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:internship_demo/routes/app_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

@RoutePage()
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,

      // ---------- PAGES ----------
      pages: [
        _buildPage(
          title1: "Accept ",
          title2: "Incoming \nMultiple Sources",
          image: 'assets/images/user_intro.png',
        ),
        _buildPage(
          title1: "Track ",
          title2: "Your Activities",
          image: 'assets/images/user_intro.png',
        ),
        _buildPage(
          title1: "Manage ",
          title2: "Your Workflow",
          image: 'assets/images/user_intro.png',
        ),
      ],

      // ---------- DOTS ----------
      dotsDecorator: const DotsDecorator(
        color: Colors.grey,
        activeColor: Colors.red,
        size: Size(8, 8),
        activeSize: Size(16, 8),
      ),

      // ---------- BUTTONS ----------
      showBackButton: true,
      back: const Icon(Icons.arrow_back, size: 26),
      next: const Icon(Icons.arrow_forward, size: 26),
      done: const Text("Login", style: TextStyle(color: Color(0xffC56751))),

      onDone: () {
        context.router.push(LoginRoute());
      },
    );
  }

  // ---------- REUSABLE PAGE BUILDER ----------
  PageViewModel _buildPage({
    required String title1,
    required String title2,
    required String image,
  }) {
    return PageViewModel(
      titleWidget: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: title1,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: title2,
              style: const TextStyle(fontSize: 40, color: Colors.black),
            ),
          ],
        ),
      ),
      bodyWidget: const Text(
        "Lorem ipsum dolor sit amet consectetur. Feugiat dis quam urna lectus.",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black54),
      ),
      image: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('assets/images/wave_bg.png', fit: BoxFit.cover),
          Image.asset(image, height: 280),
        ],
      ),
    );
  }
}
