import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/core/constans/appStyle.dart';
import 'package:islami/core/constans/app_constants.dart';
import 'package:islami/core/modules/layout/widgets/save_card_widget.dart';
import 'package:islami/core/modules/layout/widgets/sura_card_widget.dart';
import 'package:islami/core/modules/sora_details/model/sora_model.dart';
import 'package:islami/core/themes/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late ScrollController scrollController;
  List<String> ids = [];
  List<int> searchList = [];

  //  late SoraModel soraModel;

  // Object? get soraModel => null;
  @override
  void initState() {
    scrollController = ScrollController();
    getData();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ResizeImage(
                  AssetImage('assets/images/quran_bg.png'),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },

                      onChanged: (value) {
                        search(value);
                      },
                      cursorColor: AppColors.whiteColor,

                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        fillColor: AppColors.blackColor.withValues(alpha: 0.5),
                        filled: true,

                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: SvgPicture.asset(
                            'assets/svg/ic_quran.svg',
                            fit: BoxFit.scaleDown,

                            colorFilter: ColorFilter.mode(
                              AppColors.goldColor,
                              BlendMode.srcIn,
                            ),
                            width: 30,
                          ),
                        ),
                        hintText: ' Sura Name',
                        hintStyle: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                        border: AppStyle.radious10BorderWhite,

                        enabledBorder: AppStyle.radious10BorderWhite,
                        focusedBorder: AppStyle.radious10BorderWhite,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  if (ids.isNotEmpty && searchList.isEmpty)
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          textAlign: TextAlign.left,
                          'Most Recently',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 8),
                  if (ids.isNotEmpty && searchList.isEmpty)
                    SizedBox(
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: ListView.separated(
                          controller: scrollController,
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 20);
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: ids.length,
                          itemBuilder: (context, index) {
                            int myId = int.parse(ids[index]);

                            return SaveCardWidget(myId: myId);
                          },
                        ),
                      ),
                    ),
                  SizedBox(height: 30),

                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,

                      separatorBuilder: (context, index) {
                        return Divider(indent: 30, endIndent: 30, height: 22);
                      },
                      itemCount: searchList.isEmpty
                          ? AppConstants.suaAr.length
                          : searchList.length,
                      itemBuilder: (context, i) {
                        int index = searchList.isEmpty ? i : searchList[i];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SuraCardWidget(
                            onTap: (soraModel) {
                              setData(index.toString());
                            },
                            soraModel: SoraModel(
                              id: (index + 1),
                              suraAr: AppConstants.suaAr[index],
                              suraEn: AppConstants.suraEn[index],
                              suraVerses: AppConstants.ayaVerses[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    // return Container(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: AssetImage('assets/images/quran_bg.png'),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   child: Column(
    //     children: [
    //       Expanded(
    //         child: Container(
    //           width: double.infinity,
    //           decoration: BoxDecoration(
    //             gradient: LinearGradient(
    //               colors: [
    //                 AppColors.blackColor.withValues(alpha: 0.7),
    //                 AppColors.blackColor,
    //               ],
    //               begin: Alignment.topCenter,
    //               end: Alignment.bottomCenter,
    //             ),
    //           ),
    //           child: SafeArea(
    //             child: Padding(
    //               padding: const EdgeInsets.all(12.0),
    //               child: Column(
    //                 children: [
    //                   Image.asset(
    //                     'assets/images/img_header.png',
    //                     width: 300,
    //                     height: 141,
    //                   ),

    //                   Expanded(
    //                     child: ListView.separated(
    //                       separatorBuilder: (context, index) {
    //                         return Divider(
    //                           indent: 15,
    //                           endIndent: 15,
    //                           height: 15,
    //                         );
    //                       },
    //                       itemCount: AppConstants.suaAr.length,
    //                       itemBuilder: (context, index) {
    //                         return Padding(
    //                           padding: const EdgeInsets.symmetric(
    //                             vertical: 4.0,
    //                           ),
    //                           child: Row(
    //                             children: [
    //                               Container(
    //                                 width: 70,
    //                                 height: 70,
    //                                 decoration: BoxDecoration(
    //                                   image: DecorationImage(
    //                                     image: AssetImage(
    //                                       'assets/images/img_sur_number_frame.png',
    //                                     ),
    //                                     fit: BoxFit.cover,
    //                                   ),
    //                                 ),
    //                                 child: Padding(
    //                                   padding: const EdgeInsets.only(top: 6),
    //                                   child: Center(
    //                                     child: Text(
    //                                       (index + 1).toString(),
    //                                       style: AppStyle.bold20White,
    //                                     ),
    //                                   ),
    //                                 ),
    //                               ),
    //                               SizedBox(width: 15),
    //                               Expanded(
    //                                 child: Column(
    //                                   crossAxisAlignment:
    //                                       CrossAxisAlignment.start,
    //                                   children: [
    //                                     Text(
    //                                       AppConstants.suraEn[index],
    //                                       style: AppStyle.bold20White,
    //                                     ),
    //                                     Text(
    //                                       AppConstants.ayaNumber[index],
    //                                       style: AppStyle.bold20White,
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                               Text(
    //                                 AppConstants.suaAr[index],
    //                                 style: AppStyle.bold20White,
    //                               ),
    //                             ],
    //                           ),
    //                         );
    //                       },
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Future<void> setData(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ids.remove(id);
    ids.insert(0, id);
    await prefs.setStringList('recentSura', ids);
    setState(() {});

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          0,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    });
  }

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ids = prefs.getStringList('recentSura') ?? [];
    setState(() {});
  }

  void search(String q) {
    searchList = [];
    if (q.isEmpty) {
      setState(() {});
      return;
    }
    AppConstants.suaAr.where((element) {
      if (element.toLowerCase().contains(q.toLowerCase())) {
        searchList.add(AppConstants.suaAr.indexOf(element));
      }
      return true;
    }).toList();

    AppConstants.suraEn.where((element) {
      if (element.toLowerCase().contains(q.toLowerCase())) {
        searchList.add(AppConstants.suraEn.indexOf(element));
      }
      return true;
    }).toList();

    setState(() {});
  }
}
