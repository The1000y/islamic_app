import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/constans/ids.dart';
import 'package:islami/core/modules/sora_details/model/sora_model.dart';

import 'package:islami/core/themes/colors.dart';

class SoraDetailsScreen extends StatefulWidget {
  const SoraDetailsScreen({super.key});

  static const String id = AppId.soraDetailsScreenId;

  @override
  State<SoraDetailsScreen> createState() => _SoraDetailsScreenState();
}

class _SoraDetailsScreenState extends State<SoraDetailsScreen> {
  late SoraModel soraModel;
  String sora = '';
  List<String> soraList = [];

  @override
  Widget build(BuildContext context) {
    soraModel = ModalRoute.of(context)!.settings.arguments as SoraModel;
    if (soraList.isEmpty) {
      readDate();
    }
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
            soraModel.suraEn,
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
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/img_left_corner.png'),
                  Text(
                    soraModel.suraAr,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.goldColor,
                    ),
                  ),
                  Image.asset('assets/images/img_right_corner.png'),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView(
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    TextSpan(
                      children: soraList.map((String sora) {
                        final index = soraList.indexOf(sora);
                        return TextSpan(
                          children: [
                            ...sora.split(' ').map((word) {
                              return TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return SytyleOfShowModalottom(
                                          sora: sora,
                                        );
                                      },
                                    );
                                  },

                                text: '$word ',
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 25,
                                  color: word.contains('اللَّه')
                                      ? Colors.amber
                                      : AppColors.goldColor,
                                ),
                              );
                            }),
                            // TextSpan(
                            //   text: sora,
                            //   style: TextStyle(
                            //     fontSize: 28,
                            //     color: AppColors.goldColor,
                            //   ),
                            // ),
                            TextSpan(
                              text: '${[index + 1].toString()} ',
                              style: TextStyle(
                                fontSize: 28,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),

            //todo: newVesion
            // Expanded(
            //   child: ListView(
            //     children: [
            //       Text.rich(

            // textAlign: TextAlign.center,
            //         textDirection: TextDirection.rtl,
            //         TextSpan(
            //           children: soraList.asMap().entries.map((entry) {
            //             final index = entry.key;
            //             final aya = entry.value;
            //             return TextSpan(
            //               children: [
            //                 ...aya.split(' ').map((word) {
            //                   return TextSpan(
            //                     text: '$word ',
            //                     style: TextStyle(
            //                       fontSize: 25,
            //                       color: word.contains('اللَّه')
            //                           ? Colors.yellow
            //                           : AppColors.goldColor,
            //                     ),
            //                   );
            //                 }),

            // TextSpan(
            //                   text: '[${index + 1}] ',
            //                   style: TextStyle(
            //                     fontSize: 28,
            //                     color: AppColors.whiteColor,
            //                   ),
            //                 ),
            //               ],
            //             );
            //           }).toList(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            //  todo: old version
            // Expanded(
            //   child: ListView.separated(
            //     separatorBuilder: (context, index) {
            //       return SizedBox(height: 12);
            //     },
            //     itemCount: soraList.length,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 16),
            //         child: Container(
            //           padding: EdgeInsets.all(10),
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(16),
            //             border: Border.all(color: AppColors.goldColor),
            //           ),
            //           child: Center(
            //             child: Text(
            //               textDirection: TextDirection.rtl,
            //               textAlign: TextAlign.center,
            //               '${soraList[index]}  {${index + 1}}',
            //               style: TextStyle(
            //                 fontSize: 20,
            //                 color: AppColors.goldColor,
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // Image.asset(
            //   fit: BoxFit.cover,
            //   'assets/images/img_bottom_decoration.png',
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> readDate() async {
    sora = await rootBundle.loadString('assets/suras/${soraModel.id}.txt');
    soraList = sora.trim().split('\n');
    setState(() {});
  }
}

// ignore: must_be_immutable
class SytyleOfShowModalottom extends StatelessWidget {
  SytyleOfShowModalottom({super.key, required this.sora});

  String sora;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Text(
          sora,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
