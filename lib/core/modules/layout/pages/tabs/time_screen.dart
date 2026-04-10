import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/constans/appStyle.dart';

class Prayer {
  final String name;
  final String time;
  final String period;
  Prayer(this.name, this.time, this.period);
}

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 2;
    const String gregorianDate = "16 Jul, 2024";
    const String hijriDate = "09 Muh, 1446";
    const String dayName = "Tuesday";
    const String nextPrayTime = "02:32";

    // --- المتغيرات ---
    // متغير لتحديد الكارد النشط حالياً (مثلاً العصر)

    final List<Prayer> prayers = [
      Prayer("Fajr", "04:04", "AM"),
      Prayer("Dhuhr", "01:01", "PM"),
      Prayer("ASR", "04:38", "PM"),
      Prayer("Maghrib", "07:57", "PM"),
      Prayer("Isha", "09:20", "PM"),
    ];

    // ألوان التصميم
    // const Color primaryGold = Color(0xFFD4B483); // اللون الذهبي الفاتح
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
                  Container(
                    width: double.infinity,
                    // padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xff856B3F), // اللون الذهبي الأساسي
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
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    gregorianDate,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const Text(
                                    "Pray Time",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    hijriDate,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              dayName,
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
                                itemCount: prayers.length,
                                itemBuilder: (context, index, realIndex) {
                                  bool isActive = (index == currentIndex);
                                  return _buildPrayerCard(
                                    prayers[index],
                                    isActive,
                                  );
                                },
                                options: CarouselOptions(
                                  height: 130,
                                  viewportFraction: 0.35,
                                  initialPage: currentIndex,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: false,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "Next Pray - $nextPrayTime",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const Icon(
                                  Icons.volume_off_rounded,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text("Azkar", style: AppStyle.bold25White),
                  // const SizedBox(height: 15),

                  // قسم الأذكار
                  Row(
                    children: [
                      _buildAzkarCard(
                        "Evening Azkar",
                        "assets/images/bell-icon 1.png",
                      ), // متغير: صورة الأذكار
                      const SizedBox(width: 15),
                      _buildAzkarCard(
                        "Morning Azkar",
                        "assets/images/comment-bubble-icon 1.png",
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

  Widget _buildPrayerCard(Prayer prayer, bool isActive) {
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
            prayer.name,
            style: TextStyle(
              color: isActive ? Colors.white70 : Colors.black54,
              fontSize: 14,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            prayer.time,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontSize: isActive ? 22 : 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            prayer.period,
            style: TextStyle(
              color: isActive ? Colors.white60 : Colors.black54,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  // --- ويدجيت مخصصة لكروت الأذكار (External Widget) ---
  Widget _buildAzkarCard(String title, String imagePath) {
    return Expanded(
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
    );
  }
}
