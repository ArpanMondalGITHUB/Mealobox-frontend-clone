import 'package:flutter/material.dart';
import 'package:mealoboxclone/presentation/onboarding/intro_page_one.dart';
import 'package:mealoboxclone/presentation/onboarding/intro_page_three.dart';
import 'package:mealoboxclone/presentation/onboarding/intro_page_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
 final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          children: [
            IntroPageOne(controller: _controller,),
            IntroPageTwo(controller: _controller,),
            IntroPageThree(),
          ],
        ),
        Container(
            alignment:const Alignment(0, 0.55),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect:const ExpandingDotsEffect(dotHeight: 2.0, dotWidth: 6.0),
            ))
      ],
    ));
  }
}
