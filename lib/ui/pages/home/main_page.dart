import 'dart:io';
import 'package:flutter/material.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/home/article_page_api.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/home/home_page.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/scan_process.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  //state mainpage
  @override
  State<MainPage> createState() => _MainState();
}

class _MainState extends State<MainPage> {
  int _currentindex = 0;

  late File image;
  final picker = ImagePicker();

  Future getImage(source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        var state = 1;
        if (source == ImageSource.camera) {
          state = 2;
        } else {
          state = 1;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (contex) => ScanProcess(
              image: image,
              state: state,
            ),
          ),
        );
      } else {
        print('No image selected.');
      }
    });
  }

  List pages = [HomePage(), HomePage(), ArticlePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_currentindex],
        bottomNavigationBar: ConvexAppBar(
            style: TabStyle.fixedCircle,
            backgroundColor: yellowColor,
            activeColor: blue2Color,
            items: [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.camera, title: 'Camera'),
              TabItem(icon: Icons.article, title: 'Article'),
            ],
            initialActiveIndex: 0, //optional, default as 0
            onTap: (int i) {
              setState(() {
                _currentindex = i;
                if (i == 1) {
                  getImage(ImageSource
                      .camera); // Panggil metode saat ikon kamera diklik
                }
              });
            }));
  }
}
