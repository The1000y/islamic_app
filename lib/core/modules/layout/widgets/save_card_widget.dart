import 'package:flutter/material.dart';
import 'package:islami/core/constans/app_constants.dart';
import 'package:islami/core/modules/sora_details/model/sora_model.dart';
import 'package:islami/core/modules/sora_details/pages/sura_details_screen.dart';
import 'package:islami/core/themes/colors.dart';

class SaveCardWidget extends StatelessWidget {
  const SaveCardWidget({super.key, required this.myId});

  final int myId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SoraDetailsScreen.id,
          arguments: SoraModel(
            id: myId + 1,
            suraAr: AppConstants.suaAr[myId],
            suraEn: AppConstants.suraEn[myId],
            suraVerses: AppConstants.ayaVerses[myId],
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: 270,
        // height: 120,
        decoration: BoxDecoration(
          color: AppColors.goldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Spacer(flex: 1),
                    Text(
                      AppConstants.suaAr[myId],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    Text(
                      AppConstants.suraEn[myId],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    Spacer(flex: 2),
                    Text(
                      '${AppConstants.ayaVerses[myId]} Verses',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackColor,
                      ),
                    ),
                    Spacer(flex: 1),
                  ],
                ),
              ),
            ),
            Image.asset('assets/images/quranSura.png'),
          ],
        ),
      ),
    );
  }
}
