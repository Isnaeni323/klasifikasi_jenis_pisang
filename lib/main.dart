import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:klasifikasi_jenis_pisang/provider/article_page_provider.dart';
import 'package:klasifikasi_jenis_pisang/provider/page_provider.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/about_me.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/home/main_page.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/onboarding_screen_page.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/splash_screen_page.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageProvider()),
        ChangeNotifierProvider(create: (context) => ArticlePageProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreenPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/main': (context) => const MainPage(),
          '/about-me': (context) => const AboutMeScreenPage(),
        },
      ),
    );
  }
}
