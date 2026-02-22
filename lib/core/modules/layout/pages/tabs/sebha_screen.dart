import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:islami/core/themes/colors.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  ValueNotifier<int> numberOfSebha = ValueNotifier(0);
  List<String> nameOfSebhaList = [
    'سبحان الله ',
    'الحمدلله',
    'الله أكبر',
    ' لا اله الا الله',
  ];
  int currentIndex = 0;

  double rotateDegree = 1.0;

  @override
  void dispose() {
    numberOfSebha.dispose();
    super.dispose();
  }

  void rotateImage() {
    rotateDegree += 10;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sebha_bg.png'),
                fit: BoxFit.cover,
              ),
            ),

            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff202020).withValues(alpha: 0.7),
                    Color(0xff202020),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        'assets/images/img_header.png',
                        width: 300,
                        height: 141,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 86,
                    width: 145,
                    child: Image.asset('assets/images/headsebha.png'),
                  ),
                  Stack(
                    children: [
                      Center(
                        child: InkWell(
                          onTap: () {
                            numberOfSebha.value++;
                            if (numberOfSebha.value == 33) {
                              // currentIndex++;
                              numberOfSebha.value = 0;
                              currentIndex =
                                  (currentIndex + 1) % nameOfSebhaList.length;
                            }
                            // if (currentIndex == nameOfSebhaList.length) {
                            //   currentIndex = 0;
                            // }

                            rotateImage();
                          },
                          child: Transform.rotate(
                            angle: rotateDegree * math.pi / 12.0,
                            child: Center(
                              child: SizedBox(
                                height: 381,
                                width: 379,
                                child: Image.asset(
                                  'assets/images/SebhaBody 1.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        bottom: 10,
                        child: Center(
                          child: Text(
                            nameOfSebhaList[currentIndex],
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: numberOfSebha,
                        builder: (context, value, child) {
                          return Positioned.fill(
                            top: 90,
                            child: Center(
                              child: Text(
                                value.toString(),
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  // ValueListenableBuilder<int>(
                  //   valueListenable: numberOfSebha,
                  //   builder: (context, value, child) {
                  //     return InkWell(
                  //       onTap: () {
                  //         numberOfSebha.value++;
                  //         if (numberOfSebha.value == 34) {
                  //           numberOfSebha.value = 0;
                  //         }
                  //       },
                  //       child: Container(
                  //         decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //             image: AssetImage(
                  //               'assets/images/SebhaBody 1.png',
                  //             ),
                  //           ),
                  //         ),
                  //         child: SizedBox(
                  //           height: 381,
                  //           width: 379,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Center(
                  //                 child: Text(
                  //                   'سبحان الله',
                  //                   style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: 36,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ),
                  //               Center(
                  //                 child: Text(
                  //                   value.toString(),
                  //                   style: TextStyle(
                  //                     color: AppColors.whiteColor,
                  //                     fontSize: 36,
                  //                     fontWeight: FontWeight.bold,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
