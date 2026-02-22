import 'package:flutter/material.dart';
import 'package:islami/core/widgets/custom_images.dart';

class HeaderPageView extends StatelessWidget {
  const HeaderPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: CustomImage(
            image: 'assets/images/Mosque-01.png',
            heightImage: 151,
            widthImage: 290,
          ),
        ),
        Positioned(
          left: 120,
          top: 45,

          child: ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(
                colors: [Color(0xffC0A37C), Color(0xffFFD482)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ).createShader(bounds);
            },

            child: SizedBox(
              height: 90,
              width: 180,
              child: Image.asset('assets/images/Islami.png'),
            ),
          ),
        ),
      ],
    );
  }
}
