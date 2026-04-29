import 'package:flutter/material.dart';
import 'package:islami/core/constans/ids.dart';
import 'package:islami/core/model/azka_data_model.dart';
import 'package:islami/core/themes/colors.dart';
import 'package:islami/core/widgets/azkar_card_widget.dart';

class AzkarDetails extends StatefulWidget {
  const AzkarDetails({super.key});
  static const String id = AppId.azkarDetailsScreen;

  @override
  State<AzkarDetails> createState() => _AzkarDetailsState();
}

class _AzkarDetailsState extends State<AzkarDetails> {
  @override
  @override
  Widget build(BuildContext context) {
    var myData = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,

      body: Column(
        children: [
          Expanded(
            child: Container(
              // alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ResizeImage(
                    AssetImage('assets/images/more_bg.png'),
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

                child: SafeArea(
                  bottom: false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.goldColor,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: Text(
                              myData == 'morning_azkar'
                                  ? 'Morning Azkar'
                                  : 'Evening Azkar',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColors.goldColor,
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),

                      Expanded(
                        child: FutureBuilder(
                          future: AzkaDataModel.getAzkarContent(myData),
                          builder: (context, snapshot) {
                            var data = snapshot.data;
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Column(
                                children: [
                                  Text(snapshot.error.toString()),
                                  TextButton(
                                    onPressed: () {
                                      AzkaDataModel.getAzkarContent(myData);
                                      setState(() {});
                                    },
                                    child: Text('Refresh'),
                                  ),
                                ],
                              );
                            } else {
                              return ListView.builder(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return AzkarCardCustom(
                                    contant: data[index].content ?? '',
                                    count: data[index].count ?? '',
                                    description: data[index].description ?? '',
                                  );
                                },
                                itemCount: data!.length,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ), // محتوى الصفحة
        ],
      ),
    );
  }
}
