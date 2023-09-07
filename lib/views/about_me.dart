import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio_website/globals/app_assets.dart';
import 'package:personal_portfolio_website/globals/app_colors.dart';
import 'package:personal_portfolio_website/globals/constants.dart';
import 'package:personal_portfolio_website/helper%20class/helper_class.dart';
import '../globals/app_buttons.dart';
import '../globals/app_text_styles.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool val = false;
  Widget func1() {
    return Column(children: [
      Text(
        'I\'m an undergraduate at National Institute of Technology, Kurukshetra, pursuing my major in Electronics And Communication. I\'m on a relentless quest for innovation. I\'m not just a developer; I\'m a visionary craftsman. I thrive within diverse communities, where I champion the cause of elegant, maintainable code that\'s a joy to work with.',
        style: AppTextStyles.normalStyle(),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        'My current journey involves the exciting realm of cross-platform app development, where I\'m shaping tomorrow\'s digital experiences. Simultaneously, I\'m on a relentless pursuit of mastering the intricate world of data structures and algorithms, always ready to conquer the toughest challenges.',
        style: AppTextStyles.normalStyle(),
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        'But that\'s not all - I\'m also an ardent devotee of competitive programming, where I pit my skills against the best. I don\'t just code; I create, innovate, and compete to achieve excellence.',
        style: AppTextStyles.normalStyle(),
      ),
    ]);
  }

  Widget func2() {
    return Text(
      'I\'m an undergraduate at National Institute of Technology, Kurukshetra, pursuing my major in Electronics And Communication. I\'m on a relentless quest for innovation. I\'m not just a developer; I\'m a visionary craftsman. I thrive within diverse communities, where I champion the cause of elegant, maintainable code that\'s a joy to work with.',
      style: AppTextStyles.normalStyle(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        children: [
          buildAboutMeContents(),
          Constants.sizedBox(height: 35.0),
          buildProfilePicture(),
        ],
      ),
      tablet: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildProfilePicture(),
          Constants.sizedBox(width: 25.0),
          Expanded(child: buildAboutMeContents())
        ],
      ),
      paddingWidth: size.width * 0.1,
      bgColor: AppColors.bgColor2,
    );
  }

  FadeInRight buildProfilePicture() {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Image.asset(
        AppAssets.profile2,
        height: 450,
        width: 400,
      ),
    );
  }

  Column buildAboutMeContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                'About Me',
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
        Constants.sizedBox(height: 6.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: Text(
            'Flutter Developer!',
            style: AppTextStyles.montserratStyle(color: Colors.white),
          ),
        ),
        Constants.sizedBox(height: 8.0),
        FadeInLeft(
          duration: const Duration(milliseconds: 1600),
          child: val==false?func2():func1(),
        ),
        Constants.sizedBox(height: 15.0),
        FadeInUp(
          duration: const Duration(milliseconds: 1800),
          child: AppButtons.buildMaterialButton(
              onTap: () {
                setState(() {
                  val = !val;
                });
              },
              buttonName: 'Read More'),
        )
      ],
    );
  }
}
