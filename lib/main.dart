import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/core/modules/azkar_details/azkar_details.dart';
import 'package:islami/core/modules/hadeeth_details/page/hadeeth_details_page.dart';
import 'package:islami/core/modules/intro/screen/intro_screen.dart';
import 'package:islami/core/modules/layout/pages/layout_screen.dart';
import 'package:islami/core/modules/sora_details/pages/sura_details_screen.dart';
import 'package:islami/core/modules/splash/screen/splash_screen.dart';
import 'package:islami/provider/radio_manager_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => RadioManagerProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: GoogleFonts.tajawal().fontFamily),
      // home: SplashScreen(),
      routes: {
        LayoutScreen.id: (context) => LayoutScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        IntroScreen.id: (context) => IntroScreen(),
        SoraDetailsScreen.id: (context) => SoraDetailsScreen(),
        HadeethDetailsScreen.id: (context) => HadeethDetailsScreen(),
        AzkarDetails.id: (context) => AzkarDetails(),
      },
      // initialRoute: SplashScreen.id,
    );
  }
}
