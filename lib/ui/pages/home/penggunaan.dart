import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import 'package:klasifikasi_jenis_pisang/ui/widgets/penggunaan_widget.dart';

class Penggunaan extends StatefulWidget {
  const Penggunaan({Key? key}) : super(key: key);

  @override
  _PenggunaanState createState() => _PenggunaanState();
}

class _PenggunaanState extends State<Penggunaan> {
  _storeOnboardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('screen', 0);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        toolbarHeight: getProportionateScreenHeight(60),
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(30)),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: yellowColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: (() => Navigator.pop(context)),
                  child: Container(
                    margin:
                        EdgeInsets.only(left: getProportionateScreenWidth(10)),
                    child: const Icon(Icons.arrow_back_rounded,
                        size: 24, color: whiteColor),
                  )),
              Text(
                'Usage Instructions',
                style: opensansTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: weightBold,
                  color: whiteColor,
                ),
              ),
              const SizedBox(width: 20)
            ],
          ),
        ),
      ),
      body: VsScrollbar(
        controller: _scrollController,
        showTrackOnHover: true, // default false
        isAlwaysShown: true,
        style: VsScrollbarStyle(
          color: bgColor,
          hoverThickness: 100.0,
          radius: Radius.circular(5),
          thickness: 7,
        ),

        child: ListView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(5)),
          children: [
            // Container(
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       //girl asset dan title
            //       Text(
            //         'Mooi Skin',
            //         style: aclonicaTextStyle.copyWith(
            //           fontSize: 30,
            //           fontWeight: weightBold,
            //           color: greenColor,
            //         ),
            //       ),
            //       Image.asset(
            //         'assets/splash_girl_3.png',
            //         width: getProportionateScreenWidth(120),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(40),
                left: getProportionateScreenWidth(25),
                right: getProportionateScreenWidth(25),
                bottom: getProportionateScreenWidth(40),
              ),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: getProportionateScreenHeight(30),
                          left: getProportionateScreenWidth(30),
                          right: getProportionateScreenWidth(30),
                          bottom: getProportionateScreenHeight(42),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PenggunaanWidget(
                              stepImage: 'assets/s_1.png',
                              step: 'Home Page',
                            ),
                            PenggunaanWidget(
                              stepImage: 'assets/s_2.png',
                              step:
                                  'Take a picture from the camera\nor upload from the gallery',
                            ),
                            PenggunaanWidget(
                              stepImage: 'assets/s_3.png',
                              step: 'Point the camera at banana',
                            ),
                            PenggunaanWidget(
                              stepImage: 'assets/s_4.png',
                              step: 'Make sure banana is clearly visible',
                            ),
                            PenggunaanWidget(
                              stepImage: 'assets/s_5.png',
                              step: "Click 'Detection'",
                            ),
                            PenggunaanWidget(
                              stepImage: 'assets/s_6.png',
                              step: 'Wait for processing',
                            ),
                            PenggunaanWidget(
                              stepImage: 'assets/s_7.png',
                              step: 'See the result',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40)),
          ],
        ),
      ),
    );
  }
}
