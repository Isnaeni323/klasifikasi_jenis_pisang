import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/scan_process.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/home/penggunaan.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File image;
  final picker = ImagePicker();

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      int state = source == ImageSource.camera ? 2 : 1;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanProcess(
            image: image,
            state: state,
          ),
        ),
      );
    } else {
      // Replace print with proper logging mechanism
      // print('No image selected.');
      debugPrint('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: bgColor,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/about-me');
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(50),
                      right: getProportionateScreenWidth(25),
                    ),
                    child: Image.asset(
                      'assets/about_me.png',
                      width: getProportionateScreenWidth(30),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(11),
                left: getProportionateScreenWidth(25),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Boti',
                        style: aclonicaTextStyle.copyWith(
                          fontSize: 30,
                          fontWeight: weightBold,
                          color: greenColor,
                        ),
                      ),
                      Text(
                        '"Pisang mungkin terlihat serupa, \n tetapi setiap jenis memiliki \n keunikan tersendiri."',
                        style: aclonicaTextStyle.copyWith(
                          fontSize: 15,
                          height: 1.3,
                          fontWeight: weightBold,
                          color: greenColor,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Lottie.asset(
                      'assets/onboarding2.json',
                      width: getProportionateScreenWidth(160),
                      height: getProportionateScreenHeight(176),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(600),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Check your skin section
                  Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(30),
                      left: getProportionateScreenWidth(30),
                      right: getProportionateScreenWidth(30),
                      bottom: getProportionateScreenHeight(42),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scan Your Banana',
                          style: aclonicaTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: weightBold,
                            color: greenColor,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(24),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (() => getImage(ImageSource.camera)),
                              child: Image.asset(
                                'assets/camera_yellow.png',
                                width: getProportionateScreenWidth(145),
                                height: getProportionateScreenHeight(130),
                              ),
                            ),
                            GestureDetector(
                              onTap: (() => getImage(ImageSource.gallery)),
                              child: Image.asset(
                                'assets/galeri_yellow.png',
                                width: getProportionateScreenWidth(145),
                                height: getProportionateScreenHeight(130),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Line section
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(
                        23,
                      ),
                    ),
                    width: double.infinity,
                    height: 1,
                    color: const Color(0xFFE5E5E5),
                  ),
                  // Articles section
                  Container(
                    margin: EdgeInsets.only(
                      top: getProportionateScreenHeight(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(30),
                          ),
                          child: Text(
                            'Learn More',
                            style: aclonicaTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: weightBold,
                              color: greenColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(30),
                        ),
                        Container(
                          width: double.infinity,
                          height: 200,
                          margin: EdgeInsets.only(
                            left: getProportionateScreenWidth(30),
                            right: getProportionateScreenWidth(30),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/bg_penggunaan.jpg'),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: getProportionateScreenWidth(40),
                                      left: getProportionateScreenWidth(15),
                                    ),
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(30),
                                        ),
                                        Text(
                                          'Read the\nfollowing usage\ninstructions',
                                          style: aclonicaTextStyle.copyWith(
                                            fontSize: 20,
                                            fontWeight: weightBold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: getProportionateScreenWidth(120),
                                    height: getProportionateScreenHeight(30),
                                    margin: EdgeInsets.only(
                                      left: getProportionateScreenWidth(15),
                                      top: getProportionateScreenWidth(11),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        backgroundColor: whiteColor,
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Penggunaan(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Read',
                                        style: aclonicaTextStyle.copyWith(
                                          fontSize:
                                              getProportionateScreenWidth(12),
                                          fontWeight: weightSemiBold,
                                          color: yellowColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Lottie.asset(
                                  'assets/LottieLearn.json',
                                  width: getProportionateScreenWidth(160),
                                  height: getProportionateScreenHeight(176),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
