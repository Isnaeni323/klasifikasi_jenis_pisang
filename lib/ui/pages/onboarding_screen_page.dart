import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';
import 'package:klasifikasi_jenis_pisang/ui/widgets/onboarding_widget.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('screen', 1);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget customOnBoarding4() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ubah Image.asset menjadi Lottie.asset
                Lottie.asset(
                  'assets/onboarding4.json', // Ubah file menjadi file animasi Lottie
                  width: getProportionateScreenWidth(270),
                  height: getProportionateScreenHeight(355),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: getProportionateScreenHeight(5),
              left: getProportionateScreenWidth(50),
              right: getProportionateScreenWidth(50),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: getProportionateScreenHeight(30),
                left: getProportionateScreenWidth(30),
                right: getProportionateScreenWidth(30)),
            child: Text(
              'Sederhanakan cara Anda mengenali berbagai jenis pisang dengan aplikasi Boti.',
              textAlign: TextAlign.center,
              style: aclonicaTextStyle.copyWith(
                height: 1.5,
                fontWeight: weightBold,
                fontSize: 25,
                color: greenColor,
              ),
            ),
          )
        ],
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          decoration: const BoxDecoration(
            color: bgColor,
          ),
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            controller: _pageController,
            children: [
              OnBoardingWidget(
                heroImage:
                    'assets/onboarding1.json', // Ubah file menjadi file animasi Lottie
                pageController: _pageController,
              ),
              OnBoardingWidget(
                heroImage:
                    'assets/onboarding2.json', // Ubah file menjadi file animasi Lottie
                pageController: _pageController,
              ),
              OnBoardingWidget(
                heroImage:
                    'assets/onboarding3.json', // Ubah file menjadi file animasi Lottie
                pageController: _pageController,
              ),
              customOnBoarding4(),
            ],
          ),
        ),
        bottomSheet: _currentPage < 3
            ? Container(
                decoration: const BoxDecoration(
                  color: greenColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                height: getProportionateScreenHeight(267),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: getProportionateScreenHeight(72),
                        left: getProportionateScreenWidth(37),
                        right: getProportionateScreenWidth(37),
                        bottom: getProportionateScreenHeight(70),
                      ),
                      child: Text(
                        _currentPage == 0
                            ? "Atasi kebingungan, kenali jenis pisang dengan mudah menggunakan Boti"
                            : _currentPage == 1
                                ? 'Scan dan unggah gambar pisang Anda untuk mengetahui jenisnya'
                                : _currentPage == 2
                                    ? 'Apakah Anda siap untuk mengenali jenis pisang dengan mudah'
                                    : '',
                        style: aclonicaTextStyle.copyWith(
                          color: whiteColor,
                          fontSize: getProportionateScreenWidth(18),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(25),
                          horizontal: getProportionateScreenWidth(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  height: 4,
                                  width: _currentPage == 0 ? 18 : 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _currentPage == 0
                                        ? greenColor
                                        : bgColor,
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  height: 4,
                                  width: _currentPage == 1 ? 18 : 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _currentPage == 1
                                        ? greenColor
                                        : bgColor,
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  height: 4,
                                  width: _currentPage == 2 ? 18 : 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _currentPage == 2
                                        ? greenColor
                                        : bgColor,
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Text(
                                'Next',
                                style: aclonicaTextStyle.copyWith(
                                  fontWeight: weightBold,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16),
                  vertical: getProportionateScreenHeight(21),
                ),
                child: GestureDetector(
                  onTap: () {
                    _storeOnboardInfo();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main', (route) => false);
                  },
                  child: Container(
                    height: getProportionateScreenHeight(51),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'Start!',
                        style: opensansTextStyle.copyWith(
                          fontWeight: weightSemiBold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
