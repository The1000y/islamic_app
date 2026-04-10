import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:islami/api/api_manager.dart';

import 'package:islami/core/model/radio_data_model/radio_data_model.dart';
import 'package:islami/core/themes/colors.dart';
import 'package:islami/provider/radio_manager_provider.dart';
import 'package:provider/provider.dart';

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
        child: Column(
          children: [
            Expanded(
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
                      Expanded(
                        child: controller.value == 1
                            ? RadioWidget()
                            : ResiterWidget(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  late Future<RadioDataModel> futureData;
  @override
  void initState() {
    futureData = ApiManager.getRadioData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RadioDataModel>(
      future: futureData,
      builder: (context, snapshot) {
        var data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(snapshot.error.toString()),
              TextButton(
                onPressed: () {
                  ApiManager.getRadioData();
                  setState(() {});
                },
                child: Text('Refresh'),
              ),
            ],
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CustomCadRadio(
                    url: data.radios?[index].url ?? '',

                    text: data.radios?[index].name ?? '',
                  ),
                  SizedBox(height: 12),
                ],
              );
            },
            itemCount: data!.radios?.length ?? 0,
          );
        }
      },
    );

    // return Column(
    //   children: [
    //     CustomCadRadio(text: 'Radio Ibrahim Al-Akdar'),
    //     SizedBox(height: 10),
    //     CustomCadRadio(
    //       text: 'Radio Al-Qaria Yassen',

    //       // icon1: 'assets/images/Pause.png',
    //       // icon2: 'assets/images/Volume Cross.png',
    //     ),
    //     SizedBox(height: 10),
    //     CustomCadRadio(text: 'Radio Ahmed Al-trabulsi'),
    //     SizedBox(height: 10),
    //     CustomCadRadio(text: 'Radio Addokali Mohammad Alalim'),
    //     SizedBox(height: 10),
    //   ],
    // );
  }
}

class ResiterWidget extends StatelessWidget {
  const ResiterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List dataResiterWidget = [
      'Ibrahim Al-Akdar',
      'Ahmed Al-trabulsi',
      'Addokali Mohammad Alalim',
      'Al-Qaria Yassen',
    ];
    return ListView.builder(
      // shrinkWrap: true,
      // physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Column(
          children: [
            CustomCadRadio(text: dataResiterWidget[index], url: ''),
            SizedBox(height: 12),
          ],
        );
      },
      itemCount: dataResiterWidget.length,
    );
  }
}

// ignore: must_be_immutable
class CustomCadRadio extends StatelessWidget {
  const CustomCadRadio({
    super.key,
    required this.text,
    required this.url,

    this.icon1 = 'assets/images/Polygon 2.png',
    this.icon2 = 'assets/images/Volume High.png',
    this.icon3 = 'assets/images/Volume Cross.png',
    this.icon4 = 'assets/images/Pause.png',

    this.imageSound = 'assets/images/soundWave 1.png',
    this.imageMosque = 'assets/images/Mosque-02.png',
  });

  final String text;
  final String imageSound;
  final String imageMosque;
  final String icon1;
  final String icon2;
  final String icon3;
  final String icon4;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioManagerProvider>(
      builder: (context, provider, child) {
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
              image: provider.currentPlayingRadio == url && provider.isplaying
                  ? AssetImage(imageSound)
                  : AssetImage(imageMosque),
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
                  IconButton(
                    onPressed: () {
                      provider.play(url);
                    },
                    icon:
                        provider.currentPlayingRadio == url &&
                            provider.isplaying
                        ? Image.asset(icon4)
                        : Image.asset(icon1),
                  ),

                  IconButton(
                    onPressed: () {
                      provider.mute();
                    },
                    icon:
                        provider.currentPlayingRadio == url && provider.isMusted
                        ? Image.asset(icon3)
                        : Image.asset(icon2),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}
