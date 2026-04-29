import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/core/constans/ids.dart';
import 'package:islami/core/modules/layout/pages/tabs/hadeth_screen.dart';
import 'package:islami/core/modules/layout/pages/tabs/quran_screen.dart';
import 'package:islami/core/modules/layout/pages/tabs/radio_screen.dart';
import 'package:islami/core/modules/layout/pages/tabs/sebha_screen.dart';
import 'package:islami/core/modules/layout/pages/tabs/time_screen.dart';
import 'package:islami/core/themes/colors.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});
  static String id = AppId.layoutScreenId;

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int index = 0;
  final List<Widget> screens = const [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(index: index, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.goldColor,
        type: BottomNavigationBarType.shifting,

        currentIndex: index,

        selectedFontSize: 15,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: AppColors.whiteColor,
        onTap: (value) {
          index = value;
          setState(() {});
        },

        items: [
          getItem(icon: 'assets/svg/ic_quran.svg', label: 'Quan'),
          getItem(icon: 'assets/svg/ic_hadeth.svg', label: 'Hadeth'),
          getItem(icon: 'assets/svg/ic_sebha.svg', label: 'Sebha'),
          getItem(icon: 'assets/svg/ic_radio.svg', label: 'Radio'),
          getItem(icon: 'assets/svg/ic_time.svg', label: 'Time'),
        ],
      ),
    );
  }

  getItem({required String icon, required String label}) {
    return BottomNavigationBarItem(
      backgroundColor: AppColors.goldColor,
      activeIcon: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 22),
        decoration: BoxDecoration(
          color: AppColors.blackColor.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(30),
        ),
        child: SvgPicture.asset(
          icon,
          width: 28,
          height: 28,
          colorFilter: ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn),
        ),
      ),

      icon: SvgPicture.asset(icon, width: 26, height: 26),
      label: label,
    );
  }
}
