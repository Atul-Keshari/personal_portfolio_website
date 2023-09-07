import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio_website/globals/app_assets.dart';
import 'package:personal_portfolio_website/globals/app_buttons.dart';
import 'package:personal_portfolio_website/globals/app_colors.dart';
import 'package:personal_portfolio_website/globals/app_text_styles.dart';
import 'package:personal_portfolio_website/globals/constants.dart';
import 'package:personal_portfolio_website/helper%20class/helper_class.dart';
import 'package:personal_portfolio_website/widgets/profile_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final socialButtons = <String>[
    AppAssets.facebook,
    AppAssets.twitter,
    AppAssets.linkedIn,
    AppAssets.github,
  ];

  int? socialBI;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildHomePersonalInfo(size),
          Constants.sizedBox(height: 25.0),
          const ProfileAnimation()
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      desktop: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: buildHomePersonalInfo(size)),
          const ProfileAnimation(),
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: Colors.transparent,
    );
  }

  List<String> links = [
    'https://leetcode.com/AtulKeshari/',
    'https://codeforces.com/profile/404_Found_Noob',
    'https://www.linkedin.com/in/atul-keshari-026a53230/',
    'https://github.com/Atul-Keshari',
  ];
  Future<void> launchURL(String newUrl) async {
    Uri url = Uri.parse(newUrl);
    if (await launchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Column buildHomePersonalInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: Text(
            'Hello, It\'s Me',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInRight(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Atul Keshari',
            style: AppTextStyles.headingStyles(),
          ),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            children: [
              Text(
                'And I\'m a ',
                style: AppTextStyles.montserratStyle(color: Colors.white),
              ),
              AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText(
                    'Flutter Developer',
                    textStyle:
                        AppTextStyles.montserratStyle(color: Colors.lightBlue),
                  ),
                  TyperAnimatedText('Competitive Programmar',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue)),
                  TyperAnimatedText('Learner',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue))
                ],
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                repeatForever: true,
              )
            ],
          ),
        ),
        // Constants.sizedBox(height: 15.0),
        // FadeInDown(
        //   duration: const Duration(milliseconds: 1600),
        //   child: Expanded(
        //     child: Text(
        //       'Passionate Flutter developer dedicated to creating user-friendly and efficient cross-platform applications. Strong problem-solving skills and a curious mindset for continuous learning. Always seeking innovative solutions for a captivating user experience',
        //       style: AppTextStyles.normalStyle(),
        //     ),
        //   ),
        // ),
        Constants.sizedBox(height: 22.0),
        SizedBox(
          height: 48,
          child: ListView.separated(
            itemCount: socialButtons.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, child) =>
                Constants.sizedBox(width: 8.0),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  launchURL(links[index]);
                },
                onHover: (value) {
                  setState(() {
                    if (value) {
                      socialBI = index;
                    } else {
                      socialBI = null;
                    }
                  });
                },
                borderRadius: BorderRadius.circular(550.0),
                hoverColor: AppColors.themeColor,
                splashColor: AppColors.lawGreen,
                child: buildSocialButton(
                    asset: socialButtons[index],
                    hover: socialBI == index ? true : false),
              );
            },
          ),
        ),
        Constants.sizedBox(height: 18.0),
        AppButtons.buildMaterialButton(
          onTap: () {
            launchURL(
                'https://drive.google.com/file/d/1nBpujPp9ehqFcKiaLv7eE8V2OoP9Amz1/view?usp=drive_link');
          },
          buttonName: 'Download CV',
        ),
      ],
    );
  }

  Ink buildSocialButton({required String asset, required bool hover}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.themeColor, width: 2.0),
        color: AppColors.bgColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: hover ? AppColors.bgColor : AppColors.themeColor,
        fit: BoxFit.fill,
      ),
    );
  }
}