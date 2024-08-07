import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/scan_process_3.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class ScanProcess2 extends StatefulWidget {
  const ScanProcess2({Key? key, required this.image}) : super(key: key);
  final File? image;

  @override
  State<ScanProcess2> createState() => _ScanProcess2State();
}

class _ScanProcess2State extends State<ScanProcess2> {
  @override
  void initState() {
    super.initState();
    _loadModel();
    Future.delayed(const Duration(milliseconds: 500), () {
      _imageClassification(widget.image);
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  void _loadModel() async {
    await Tflite.loadModel(
      model: "assets/MobileNet.tflite",
      labels: "assets/labels.txt",
    );
  }

  void _imageClassification(File? image) async {
    var output = await Tflite.runModelOnImage(
      path: image!.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    // Validasi prediksi
    if (output != null && output.isNotEmpty) {
      var bestPrediction = output[0];
      print(
          'Prediksi terbaik: ${bestPrediction["label"]} dengan confidence ${bestPrediction["confidence"]}');

      // Memeriksa apakah confidence di atas threshold
      if (bestPrediction["confidence"] >= 0.8) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScanProcess3(
              image: widget.image,
              pred: output,
            ),
          ),
        );
      } else {
        // Handle kasus di mana confidence score kurang dari threshold
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScanProcess3(
              image: widget.image,
              pred: output,
            ),
          ),
        );
      }
    } else {
      // Handle kasus di mana tidak ada prediksi yang valid
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScanProcess3(
            image: widget.image,
            pred: [],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(40)),
                child: Lottie.asset(
                  'assets/loading_pisang4.json',
                  height: getProportionateScreenHeight(300),
                  width: getProportionateScreenWidth(300),
                ),
              ),
              Text(
                'Processing',
                style: aclonicaTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: greenColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
