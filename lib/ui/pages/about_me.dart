import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';
import 'package:klasifikasi_jenis_pisang/ui/widgets/about_me_widget.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class AboutMeScreenPage extends StatefulWidget {
  const AboutMeScreenPage({Key? key}) : super(key: key);

  @override
  _AboutMeScreenPageState createState() => _AboutMeScreenPageState();
}

class _AboutMeScreenPageState extends State<AboutMeScreenPage> {
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
          padding: EdgeInsets.only(top: getProportionateScreenHeight(40)),
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
                'About Us',
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
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(50)),
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //girl asset dan title
                  Text(
                    'Banana Classify',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 35,
                      fontWeight: weightBold,
                      color: greenColor,
                    ),
                  ),
                  Image.asset(
                    'assets/pisang_logo.png',
                    width: getProportionateScreenWidth(200),
                  ),
                  Text(
                    '"Cukup scan untuk mengetahui\n jenis pisang secara instan."',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: weightMedium,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: getProportionateScreenHeight(40),
                left: getProportionateScreenWidth(25),
                right: getProportionateScreenWidth(25),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Banana Classify hadir untuk membantu Anda mengenali dan mengklasifikasikan jenis pisang dengan mudah dan efektif.',
                        textAlign: TextAlign.justify,
                        style: opensansTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: weightMedium,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(80)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //girl asset dan title
                  Text(
                    'Team',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: weightBold,
                      color: greenColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: getProportionateScreenHeight(30),
                right: getProportionateScreenHeight(30),
                bottom: getProportionateScreenHeight(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AboutMeWidget(
                      image: 'assets/foto_isnaeni.jpg',
                      name: 'Isnaeni Nur Ahmad.',
                      info: 'TI-4B | 4.33.20.1.13',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(80)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //girl asset dan title
                  Text(
                    'Advisor',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 30,
                      fontWeight: weightBold,
                      color: greenColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: getProportionateScreenHeight(30),
                right: getProportionateScreenHeight(30),
                bottom: getProportionateScreenHeight(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AboutMeWidget(
                        image: 'assets/foto_pak_yudan.jpg',
                        name: 'Tri Raharjo Yudantoro,\n S. Kom., M. Kom.\n',
                        info: 'NIP. 196810252000121001',
                      ),
                      AboutMeWidget(
                        image: 'assets/foto_pak_lilik.jpg',
                        name: 'Liliek Triyono, S.T.,\n M. Kom.\n',
                        info: 'NIP. 198404202015041003',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
          ],
        ),
      ),
    );
  }
}
