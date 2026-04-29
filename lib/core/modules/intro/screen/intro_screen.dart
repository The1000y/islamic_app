import 'package:flutter/material.dart';
import 'package:islami/core/constans/appStyle.dart';
import 'package:islami/core/constans/ids.dart';
import 'package:islami/core/model/islamiModel.dart';
// import 'package:islami/core/modules/home/home_Screen.dart';
import 'package:islami/core/themes/colors.dart';

import 'package:islami/core/widgets/header_page_view.dart';
import 'package:islami/utilles/utilles.dart';

// ignore: must_be_immutable
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});
  static String id = AppId.introScreenid;

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(
        child: Column(
          children: [
            HeaderPageView(),
            Spacer(flex: 1),
            Expanded(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (value) {
                    currentIndex = value;
                    setState(() {
                      // pageController.animateToPage(
                      //   currentIndex + 1,
                      //   duration: const Duration(milliseconds: 500),
                      //   curve: Curves.easeInOut,
                      // );
                    });
                  },
                  itemCount: IslamiModel.islmaiList.length,

                  itemBuilder: (context, currentIndex) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: Image.asset(
                        IslamiModel.islmaiList[currentIndex].image,
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
              ),
            ),
            Spacer(flex: 1),
            Text(
              IslamiModel.islmaiList[currentIndex].title,
              style: AppStyle.bold24Gold,
            ),
            Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                textAlign: TextAlign.center,
                IslamiModel.islmaiList[currentIndex].subTitle,
                style: AppStyle.bold20Gold,
              ),
            ),
            Spacer(flex: 1),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (currentIndex > 0) {
                        pageController.animateToPage(
                          currentIndex - 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },

                    child: currentIndex == 0
                        ? SizedBox()
                        : Text(
                            'back',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.goldColor,
                            ),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIndecator(active: currentIndex == 0),
                      SizedBox(width: 15),
                      CustomIndecator(active: currentIndex == 1),
                      SizedBox(width: 15),
                      CustomIndecator(active: currentIndex == 2),
                      SizedBox(width: 15),
                      CustomIndecator(active: currentIndex == 3),
                      SizedBox(width: 15),
                      CustomIndecator(active: currentIndex == 4),
                    ],
                  ),

                  InkWell(
                    onTap: () async {
                      await CasheData.setOnBoardingScreen();
                      if (currentIndex == 4) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppId.layoutScreenId,
                          (route) => false,
                        );
                        return;
                      }

                      pageController.animateToPage(
                        currentIndex + 1,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.goldColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomIndecator extends StatelessWidget {
  const CustomIndecator({super.key, required this.active});

  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(300),
        color: active ? AppColors.goldColor : Colors.grey,
      ),
      width: active ? 40 : 10,
      height: 10,
    );
  }
}
