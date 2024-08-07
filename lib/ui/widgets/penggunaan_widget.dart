import 'package:flutter/material.dart';

import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';

class PenggunaanWidget extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  PenggunaanWidget({
    Key? key,
    required this.step,
    required this.stepImage,
  }) : super(key: key);
  final String step;
  final String stepImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(50),
      ),
      child: Column(
        children: [
          // Container(
          //   margin: EdgeInsets.only(
          //     bottom: getProportionateScreenHeight(10),
          //   ),
          //   height: getProportionateScreenHeight(176),
          //   width: getProportionateScreenWidth(160),
          //   child: Image.asset(stepImage),
          // ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(
                bottom: getProportionateScreenHeight(10),
              ),
              height: getProportionateScreenHeight(190),
              width: getProportionateScreenWidth(190),
              child: Image.asset(stepImage),
            ),
          ),
          Text(
            step,
            style: opensansTextStyle.copyWith(
              fontSize: 15,
              fontWeight: weightLight,
            ),
          ),
        ],
      ),
    );
  }
}
