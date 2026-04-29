import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constans/ids.dart';
import 'package:islami/core/modules/hadeeth_details/model/hadeeth_model.dart';
import 'package:islami/core/themes/colors.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  List<HadeethModel> hadeethList = [];
  @override
  Widget build(BuildContext context) {
    if (hadeethList.isEmpty) {
      readHadeeth();
    }
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ResizeImage(
                  AssetImage('assets/images/hadith_bg.png'),
                  height: 1000,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.blackColor.withValues(alpha: 0.7),
                    AppColors.blackColor,
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
                  Expanded(
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: double.infinity,
                        enableInfiniteScroll: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.8,
                        enlargeFactor: 0.2,
                      ),
                      items: hadeethList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  AppId.hadeethDetailsScreen,
                                  arguments: i,
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(12),
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: AppColors.goldColor,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/HadithCardBackGround.png',
                                    ),
                                    opacity: 0.4,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      textDirection: TextDirection.ltr,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          'assets/images/img_left_corner.png',
                                          color: AppColors.blackColor,
                                          fit: BoxFit.cover,
                                          width: 80,
                                        ),
                                        Expanded(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              i.title,
                                              style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.blackColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/img_right_corner.png',
                                          color: AppColors.blackColor,
                                          fit: BoxFit.cover,
                                          width: 80,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    Center(
                                      child: Text(
                                        maxLines: 13,
                                        overflow: TextOverflow.ellipsis,
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.center,
                                        i.body,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.blackColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> readHadeeth() async {
    for (int i = 1; i <= 50; i++) {
      String hadeeth = await rootBundle.loadString('assets/hadeeth/h$i.txt');

      hadeethList.add(
        HadeethModel(
          title: hadeeth.split('\n').first.trim(),

          body: hadeeth.split('\n').skip(1).join('\n').trim(),
        ),
      );
    }
    setState(() {});
  }
}
