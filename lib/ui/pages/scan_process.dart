import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/scan_process_2.dart';

class ScanProcess extends StatefulWidget {
  ScanProcess({
    Key? key,
    required this.image,
    required this.state,
  }) : super(key: key);
  //variabel menyimpan gambar
  File? image;
  final int state;

  @override
  //menyimpan informasi sumber gambar (galeri/kamera)
  State<ScanProcess> createState() => _ScanProcessState();
}

class _ScanProcessState extends State<ScanProcess> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: whiteColor,
          toolbarHeight: getProportionateScreenHeight(60),
          centerTitle: true,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(40)),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: yellowColor,
            ),
            child: Center(
              child: Text(
                'Scan',
                style: aclonicaTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),

        //menampilkan gambar yang dipilih
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(620),
                width: double.infinity,
                child: Image.file(
                  widget.image!,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(24),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: getProportionateScreenHeight(5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: getProportionateScreenHeight(50),
                      margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(30),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          backgroundColor: yellowColor,
                        ),
                        onPressed: () {
                          // file picker gallery
                          ImagePicker()
                              .pickImage(
                                  source: widget.state == 1
                                      ? ImageSource.gallery
                                      : ImageSource.camera)
                              .then((value) {
                            if (value != null) {
                              // override image
                              setState(() {
                                widget.image = File(value.path);
                              });
                            }
                          });
                        },
                        child: Icon(Icons.change_circle),
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(220),
                      height: getProportionateScreenHeight(50),
                      margin: EdgeInsets.only(
                        left: getProportionateScreenWidth(30),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          backgroundColor: greenColor,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ScanProcess2(
                                image: widget.image,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Process',
                          style: aclonicaTextStyle.copyWith(
                            fontSize: getProportionateScreenWidth(15),
                            fontWeight: weightSemiBold,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
