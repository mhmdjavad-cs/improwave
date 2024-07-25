import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';


class IntroPages extends StatelessWidget {
  const IntroPages({super.key});

  Future<void> _setIntroSeen() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('intro_seen', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
              title: "first page",
              body: "this is the first introduction page!"),
          PageViewModel(
              title: "second page",
              body: "this is the second introduction page!")
        ],
        onDone: () async {
          await _setIntroSeen();
          GoRouter.of(context).go('/home');
        },
        onSkip: () async {
          await _setIntroSeen();
          GoRouter.of(context).go('/home');
        },
        showSkipButton: true,
        skip: const Text("skip"),
        next: const Icon(Icons.arrow_forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
    );
  }
}
