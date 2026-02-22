import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constans/ids.dart';
import 'package:islami/core/widgets/custom_images.dart';
// import 'package:islami/core/modules/intro/screen/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = AppId.splashScreenId;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    delayNaviagtor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.png'),
              ),
            ),
          ),
          Positioned(
            right: 50,
            top: 60,
            child: SlideInDown(
              child: CustomImage(
                image: 'assets/images/Mosque-01.png',
                heightImage: 157,
                widthImage: 291,
              ),
            ),
          ),
          Positioned(
            right: 15,

            child: SlideInDown(
              child: CustomImage(
                image: 'assets/images/Glow.png',
                heightImage: 313,
                widthImage: 88,
              ),
            ),
          ),
          Positioned(
            top: 214,
            left: 0,

            child: SlideInLeft(
              delay: Duration(seconds: 1),
              child: CustomImage(
                image: 'assets/images/Shape-07.png',
                heightImage: 187,
                widthImage: 87,
              ),
            ),
          ),
          ZoomIn(
            duration: Duration(seconds: 5),
            child: Center(
              child: Container(
                decoration: BoxDecoration(),
                child: CustomImage(
                  image: 'assets/images/islami_logo.png',
                  heightImage: 232,
                  widthImage: 173.71591186523438,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 112,
            right: 0,

            child: SlideInRight(
              delay: Duration(seconds: 1),
              child: CustomImage(
                image: 'assets/images/Shape-04.png',
                heightImage: 187,
                widthImage: 87,
              ),
            ),
          ),

          Positioned(
            bottom: 32,
            right: 93,
            left: 93,

            child: SlideInUp(
              delay: Duration(seconds: 1),
              child: CustomImage(
                image: 'assets/images/route_logo.png',
                heightImage: 108,
                widthImage: 244,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void delayNaviagtor() {
    Future.delayed(Duration(seconds: 4), () {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, AppId.introScreenid);
      // Navigator.pushReplacement(
      //   // ignore: use_build_context_synchronously
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) {
      //       return IntroScreen();
      //     },
      //   ),
      // );
    });
  }
}
