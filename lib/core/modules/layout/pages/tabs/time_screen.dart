import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/api/api_manager.dart';
import 'package:islami/core/constans/appStyle.dart';
import 'package:islami/core/constans/ids.dart';
import 'package:islami/core/model/pray_time_data_model/pray_time_data_model.dart';
import 'package:islami/utilles/utilles.dart';
import 'package:just_audio/just_audio.dart';

// class Prayer {
//   final String name;
//   final String time;
//   final String period;
//   Prayer(this.name, this.time, this.period);
// }

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  final AudioPlayer playerSound = AudioPlayer();

  @override
  void initState() {
    playerSound.setAsset('assets/audio/a9.mp3');

    future = ApiManager.getPrayTime();
    super.initState();
  }

  Future playAudio() async {
    if (playerSound.playing) {
      await playerSound.stop();
    }
    await playerSound.play();
  }

  stopAudio() {
    playerSound.stop();
  }

  @override
  void dispose() {
    playerSound.dispose();
    super.dispose();
  }

  late Future<PrayTimeDataModel> future;

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    const Color darkBg = Color(0xFF121212); // لون الخلفية الداكن

    return Scaffold(
      backgroundColor: darkBg,
      body: Stack(
        children: [
          // خلفية المسجد (يمكنك وضع صورة هنا)
          Opacity(
            opacity: 0.22,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/more_bg.png',
                  ), // متغير: صورة الخلفية
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: 20),
                  Image.asset('assets/images/img_header.png'),
                  const SizedBox(height: 15),

                  // كارد مواقيت الصلاة الرئيسي
                  FutureBuilder(
                    future: future,
                    builder: (context, snapshot) {
                      var prayData = snapshot.data;
                      var prayTimes = PrayerTime.sortPrayerTime(
                        prayData?.data?.timings!.toTimingsJson() ?? {},
                      );
                      var prayerTimeCountDown =
                          PrayerTime.getNextPrayerCountDownTime(prayTimes);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Column(
                          children: [
                            Text(snapshot.error.toString()),
                            TextButton(
                              onPressed: () {
                                ApiManager.getPrayTime();
                                setState(() {});
                              },
                              child: Text('Refresh'),
                            ),
                          ],
                        );
                      } else {
                        return Container(
                          width: double.infinity,
                          // padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xff856B3F,
                            ), // اللون الذهبي الأساسي
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Stack(
                            children: [
                              // 1. الصورة الخلفية (النقشة) - تغطي الكارد من الداخل
                              Positioned.fill(
                                child: ClipRRect(
                                  // لضمان أن الصورة لا تخرج عن حدود حواف الكارد المنحنية
                                  borderRadius: BorderRadius.circular(30),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Image.asset(
                                      'assets/images/shape55.png',
                                      fit: BoxFit.cover,
                                      // لتغطية كامل مساحة المربع الذهبي
                                    ),
                                  ),
                                ),
                              ),

                              // 2. المحتوى (النصوص والسلايدر) يوضع فوق الصورة
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // السطر العلوي (التواريخ)
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${prayData!.data!.date!.gregorian!.day} ${prayData.data!.date!.gregorian!.month!.en},\n${prayData.data!.date!.gregorian!.year}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 16,
                                          ),
                                          child: Text(
                                            "Pray Time",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                        Text(
                                          '${prayData.data!.date!.hijri!.day} ${prayData.data!.date!.hijri!.month!.en},\n${prayData.data!.date!.hijri!.year}',

                                          // prayData.data!.date!.hijri?.date ??
                                          //     "Null Date",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  Text(
                                    prayData
                                            .data!
                                            .date!
                                            .gregorian
                                            ?.weekday
                                            ?.en ??
                                        "Null Date",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),

                                  const SizedBox(height: 15),

                                  // السلايدر (Carousel) يتحرك الآن فوق النقشة
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                    ),
                                    child: CarouselSlider.builder(
                                      itemCount: prayData.data!.timings!
                                          .toTimingsJson()
                                          .length,
                                      itemBuilder: (context, index, realIndex) {
                                        bool isActive = (index == currentIndex);
                                        return _buildPrayerCard(
                                          prayerName: prayTimes.keys.elementAt(
                                            index,
                                          ),

                                          prayerTimr: prayTimes.values
                                              .elementAt(index),
                                          isActive: isActive,
                                        );
                                      },
                                      options: CarouselOptions(
                                        height: 130,
                                        viewportFraction: 0.35,
                                        initialPage: currentIndex,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.25,
                                        enableInfiniteScroll: true,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            currentIndex = index;
                                          });
                                        },
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 20),

                                  // الجزء السفلي (الصلاة القادمة)
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: CountDownTimer(
                                          nextPrayTime:
                                              prayerTimeCountDown[prayTimes
                                                  .keys
                                                  .first]!,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Text("Azkar", style: AppStyle.bold25White),
                  // const SizedBox(height: 15),

                  // قسم الأذكار
                  Row(
                    children: [
                      // متغير: صورة الأذكار
                      _buildAzkarCard(
                        imagePath: "assets/images/comment-bubble-icon 1.png",
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppId.azkarDetailsScreen,
                            arguments: "morning_azkar",
                          );
                        },
                        title: "Morning Azkar",
                      ),
                      const SizedBox(width: 15),
                      _buildAzkarCard(
                        imagePath: "assets/images/bell-icon 1.png",
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppId.azkarDetailsScreen,
                            arguments: "evening_azkar",
                          );
                        },
                        title: "Evening Azkar",
                      ), // متغير: صورة الأذكار
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- ويدجيت مخصصة لمربعات الصلاة (External Widget) ---
  // Widget _buildPrayerTile(String name, String time, bool isActive) {
  //   return Container(
  //     margin: const EdgeInsets.only(right: 10),
  //     padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
  //     decoration: BoxDecoration(
  //       color: isActive
  //           ? const Color(0xFF2E2E2E)
  //           : Colors.black.withOpacity(0.05),
  //       borderRadius: BorderRadius.circular(20),
  //       border: isActive ? Border.all(color: Colors.white24) : null,
  //     ),
  //     child: Column(
  //       children: [
  //         Text(
  //           name,
  //           style: TextStyle(
  //             color: isActive ? Colors.white70 : Colors.black54,
  //             fontSize: 12,
  //           ),
  //         ),
  //         const SizedBox(height: 8),
  //         Text(
  //           time.split(" ")[0],
  //           style: TextStyle(
  //             color: isActive ? Colors.white : Colors.black,
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         const SizedBox(height: 4),
  //         Text(
  //           "PM",
  //           style: TextStyle(
  //             color: isActive ? Colors.white60 : Colors.black54,
  //             fontSize: 10,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildPrayerCard({
    required String prayerName,
    required String prayerTimr,
    required bool isActive,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        // اللون الداكن للنشط، واللون الفاتح جداً للبقية
        color: isActive
            ? const Color(0xFF2E2E2E)
            : Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(25),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            prayerName,
            style: TextStyle(
              color: isActive
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : Colors.black54,
              fontSize: 22,
              fontWeight: isActive ? FontWeight.w900 : FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            TimeConventer.convert12Hourse(prayerTimr),
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontSize: isActive ? 18 : 16,
              fontWeight: FontWeight.w900,
            ),
          ),
          // Text(
          //   prayer.period,
          //   style: TextStyle(
          //     color: isActive ? Colors.white60 : Colors.black54,
          //     fontSize: 10,
          //   ),
          // ),
        ],
      ),
    );
  }

  // --- ويدجيت مخصصة لكروت الأذكار (External Widget) ---
  Widget _buildAzkarCard({
    required VoidCallback onTap,
    required String title,
    required String imagePath,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFD4B483), width: 2),
            borderRadius: BorderRadius.circular(25),
            color: const Color.fromARGB(255, 27, 26, 26),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // هنا نضع الصورة (استخدم Placeholder حالياً)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(title, style: AppStyle.bold20White),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//---------------------------------------------------------
class CountDownTimer extends StatefulWidget {
  const CountDownTimer({super.key, required this.nextPrayTime});

  final Duration nextPrayTime;

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  bool ismute = false;
  late Duration remainingTime;
  Timer? timer;
  bool hasPlayedAdhan = false;

  final AudioPlayer playerSound = AudioPlayer();

  Future playAudio() async {
    if (playerSound.playing) {
      await playerSound.stop();
    }
    await playerSound.play();
  }

  Future stopAudio() async {
    await playerSound.stop();
  }

  @override
  void initState() {
    playerSound.setAsset('assets/audio/a9.mp3');

    super.initState();

    remainingTime = widget.nextPrayTime;

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remainingTime.inSeconds > 0) {
        setState(() {
          remainingTime -= const Duration(seconds: 1);
        });
      } else {
        timer?.cancel();
        if (!hasPlayedAdhan && !ismute) {
          hasPlayedAdhan = true;
          playerSound.play();
        }
      }
    });
  }

  @override
  void dispose() {
    playerSound.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Next Pray - ${FormatDuration().format(remainingTime)}",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.05),

        IconButton(
          onPressed: () {
            ismute = !ismute;
            if (ismute) {
              stopAudio();
            } else {
              playerSound.play();
            }

            setState(() {});
          },
          color: Colors.black,
          icon: ismute
              ? Icon(Icons.volume_off_rounded)
              : Icon(
                  Icons.volume_up_rounded,
                  // Icons.volume_off_rounded,
                ),
        ),
      ],
    );
  }
}
