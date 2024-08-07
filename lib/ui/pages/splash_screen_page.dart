import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late int screen;

  @override
  void initState() {
    super.initState();
    _getOnboardInfo();
    Future.delayed(const Duration(seconds: 3), () {
      if (screen == 0) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      } else {
        Navigator.pushReplacementNamed(context, '/main');
      }
    });
  }

  Future<void> _getOnboardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      screen = prefs.getInt('screen') ?? 0;
      print(screen);
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            //background color
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: bgColor,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //girl asset dan title
                  Image.asset(
                    'assets/pisang_logo.png',
                    width: getProportionateScreenWidth(260),
                  ),
                  Text(
                    'Boti',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 45,
                      fontWeight: weightBold,
                      color: greenColor,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                //lottie loading animation
                margin: const EdgeInsets.only(bottom: 50),
                child: Lottie.asset(
                  'assets/loading2.json',
                  height: getProportionateScreenHeight(100),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
