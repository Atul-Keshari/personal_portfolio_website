import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio_website/globals/app_text_styles.dart';
import 'package:velocity_x/velocity_x.dart';

import '../globals/app_colors.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Wrap(
        spacing: 20.0,
        runSpacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            alignment: Alignment.center,
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'My Skills',
                  textStyle: AppTextStyles.headingStyles(
                    fontSize: 40,
                  ),
                ),
              ],
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              repeatForever: true,
            ),
          ),
          //
          Container(
            width: context.screenWidth < 900
                ? context.screenWidth * 0.9
                : ((context.screenWidth * 0.7) / 3),
            decoration: BoxDecoration(
              color: AppColors.bgColor2,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Programming Langauges",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.robinEdgeBlue),
                ),
                const Divider(),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    chipSkill("C++"),
                    chipSkill("C"),
                    chipSkill("Dart"),
                    chipSkill("Structured-Query-Language"),
                    chipSkill("HTML5"),
                    chipSkill("CSS5"),
                    chipSkill("Java"),
                    chipSkill("Matlab"),
                  ],
                ),
              ],
            ),
          ),
          //
          //
          Container(
            width: context.screenWidth < 900
                ? context.screenWidth * 0.9
                : ((context.screenWidth * 0.7) / 3),
            decoration: BoxDecoration(
              color: AppColors.bgColor2,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  " Libraries and Frameworks",
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.robinEdgeBlue),
                ),
                const Divider(),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    chipSkill("Flutter"),
                    chipSkill("GetX"),
                    chipSkill("RESTful APIs"),
                    chipSkill("Provider"),
                    chipSkill("Get CLI"),
                    chipSkill("MVC Design Pattern"),
                    chipSkill("VelocityX"),
                  ],
                ),
              ],
            ),
          ),
          //
          //
          Container(
            width: context.screenWidth < 900
                ? context.screenWidth * 0.9
                : ((context.screenWidth * 0.7) / 3),
            decoration: BoxDecoration(
              color: AppColors.bgColor2,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Other Skills",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.robinEdgeBlue,
                  ),
                ),
                const Divider(),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    chipSkill("Firebase"),
                    chipSkill("Git"),
                    chipSkill("GitHub"),
                    chipSkill("Stock Trading"),
                    chipSkill("Research Skills"),
                    chipSkill("Analytical Skills"),
                    chipSkill("Leadership"),
                  ],
                ),
              ],
            ),
          ),
          //
        ],
      ),
      const SizedBox(
        height: 40,
      ),
    ]);
  }
}

Widget chipSkill(String text) {
  return Chip(
    label: Text(
      text,
    ),
    labelStyle: const TextStyle(
      color: Colors.white,
    ),
    side: BorderSide(
      color: AppColors.bgColor,
    ),
    backgroundColor: AppColors.bgColor,
  );
}
