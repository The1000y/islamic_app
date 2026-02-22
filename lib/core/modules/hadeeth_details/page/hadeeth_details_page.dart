import 'package:flutter/material.dart';
import 'package:islami/core/constans/ids.dart';
import 'package:islami/core/modules/hadeeth_details/model/hadeeth_model.dart';
import 'package:islami/core/themes/colors.dart';

class HadeethDetailsScreen extends StatelessWidget {
  const HadeethDetailsScreen({super.key});

  static String id = AppId.hadeethDetailsScreen;

  @override
  Widget build(BuildContext context) {
    HadeethModel hadeethData =
        ModalRoute.settingsOf(context)!.arguments as HadeethModel;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.goldColor),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Text(
            hadeethData.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.goldColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(16)),

            SizedBox(height: 15),
            SingleChildScrollView(
              child: Text(
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.center,
                hadeethData.body,
                style: TextStyle(fontSize: 25, color: AppColors.goldColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
