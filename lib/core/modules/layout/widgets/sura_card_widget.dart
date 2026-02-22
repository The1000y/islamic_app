import 'package:flutter/material.dart';
import 'package:islami/core/constans/appStyle.dart';
import 'package:islami/core/modules/sora_details/model/sora_model.dart';
import 'package:islami/core/modules/sora_details/pages/sura_details_screen.dart';

// ignore: must_be_immutable
class SuraCardWidget extends StatelessWidget {
  SuraCardWidget({super.key, required this.soraModel, required this.onTap});
  SoraModel soraModel;
  void Function(SoraModel soraModel) onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(soraModel);
        Navigator.pushNamed(
          context,
          SoraDetailsScreen.id,
          arguments: soraModel,
        );
      },
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img_sur_number_frame.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Center(
                child: Text(
                  soraModel.id.toString(),
                  style: AppStyle.bold20White,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(soraModel.suraEn, style: AppStyle.bold20White),
                Text(soraModel.suraVerses, style: AppStyle.bold20White),
              ],
            ),
          ),
          Text(soraModel.suraAr, style: AppStyle.bold20White),
        ],
      ),
    );
  }
}
