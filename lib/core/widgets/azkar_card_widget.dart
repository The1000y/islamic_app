import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/themes/colors.dart';

class AzkarCardCustom extends StatelessWidget {
  const AzkarCardCustom({
    super.key,
    required this.contant,
    required this.count,
    required this.description,
  });

  final String count;
  final String description;
  final String contant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            // height: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.goldColor,
                  AppColors.goldColor.withValues(alpha: 0.7),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Image.asset(
                        'assets/images/img_sur_number_frame.png',
                        width: 70,
                        height: 70,
                      ),
                      Positioned(
                        bottom: 12,
                        child: Text(
                          count,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  AutoSizeText(
                    textAlign: TextAlign.center,
                    contant,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  AutoSizeText(
                    textAlign: TextAlign.center,
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
