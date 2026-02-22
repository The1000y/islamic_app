import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/themes/colors.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  late CustomSegmentedController<int> controller;
  // bool resterWidget = false;
  TextStyle textStyleleft = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );
  TextStyle textStyleRight = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteColor,
  );
  @override
  void initState() {
    controller = CustomSegmentedController(value: 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/radio_bg.png'),
            alignment: Alignment.center,
          ),
        ),
        child: Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.blackColor,
                  AppColors.blackColor.withValues(alpha: 0.3),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/img_header.png',
                      width: 300,
                      height: 141,
                    ),
                    SizedBox(height: 7),

                    CustomSlidingSegmentedControl<int>(
                      controller: controller,
                      fixedWidth: 190,
                      innerPadding: EdgeInsets.zero,
                      dividerSettings: DividerSettings(
                        indent: 12,
                        endIndent: 12,
                      ),
                      // initialValue: 1,
                      children: {
                        1: Text(
                          'Radio',
                          style: textStyleleft,
                          textAlign: TextAlign.center,
                        ),
                        2: Text(
                          'Reciters',
                          style: textStyleRight,
                          textAlign: TextAlign.center,
                        ),
                      },
                      decoration: BoxDecoration(
                        color: AppColors.blackColor.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      thumbDecoration: BoxDecoration(
                        color: AppColors.goldColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInToLinear,
                      onValueChanged: (v) {
                        setState(() {
                          if (v == 1) {
                            textStyleleft = TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.blackColor,
                            );
                            textStyleRight = TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            );
                          } else {
                            textStyleleft = TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.whiteColor,
                            );
                            textStyleRight = TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.blackColor,
                            );
                          }
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    controller.value == 1 ? RadioWidget() : ResiterWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RadioWidget extends StatelessWidget {
  const RadioWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCadRadio(
          text: 'Radio Ibrahim Al-Akdar',
          image: 'assets/images/Mosque-02.png',
        ),
        SizedBox(height: 10),
        CustomCadRadio(
          text: 'Radio Al-Qaria Yassen',
          image: 'assets/images/soundWave 1.png',
          icon1: 'assets/images/Pause.png',
          icon2: 'assets/images/Volume Cross.png',
        ),
        SizedBox(height: 10),
        CustomCadRadio(
          text: 'Radio Ahmed Al-trabulsi',
          image: 'assets/images/Mosque-02.png',
        ),
        SizedBox(height: 10),
        CustomCadRadio(
          text: 'Radio Addokali Mohammad Alalim',
          image: 'assets/images/Mosque-02.png',
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class ResiterWidget extends StatelessWidget {
  const ResiterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCadRadio(
          text: 'Ibrahim Al-Akdar',
          image: 'assets/images/Mosque-02.png',
        ),
        SizedBox(height: 10),
        CustomCadRadio(
          text: 'Akram Alalaqmi',
          image: 'assets/images/soundWave 1.png',
          icon1: 'assets/images/Pause.png',
          icon2: 'assets/images/Volume Cross.png',
        ),
        SizedBox(height: 10),
        CustomCadRadio(
          text: 'Majed Al-Enezi',
          image: 'assets/images/Mosque-02.png',
        ),
        SizedBox(height: 10),
        CustomCadRadio(
          text: 'Malik shaibat Alhamed',
          image: 'assets/images/Mosque-02.png',
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class CustomCadRadio extends StatelessWidget {
  const CustomCadRadio({
    super.key,
    required this.text,
    required this.image,
    this.icon1 = 'assets/images/Polygon 2.png',
    this.icon2 = 'assets/images/Volume High.png',
  });

  final String text;
  final String image;
  final String icon1;
  final String icon2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      height: 150,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.goldColor,
        image: DecorationImage(
          scale: 2,

          opacity: 0.4,
          alignment: Alignment(0, 1),
          image: AssetImage(image),
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          Text(
            text,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: Image.asset(icon1)),
              IconButton(onPressed: () {}, icon: Image.asset(icon2)),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
