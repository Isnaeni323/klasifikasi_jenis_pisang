import 'package:flutter/material.dart';

import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';

class AboutMeWidget extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  AboutMeWidget({
    Key? key,
    required this.name,
    required this.info,
    required this.image,
  }) : super(key: key);
  final String image;
  final String name;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(50),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: getProportionateScreenHeight(20),
            ),
            height: getProportionateScreenHeight(130),
            width: getProportionateScreenWidth(130),
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          Text(
            name,
            style: opensansTextStyle.copyWith(
              fontSize: 15,
              fontWeight: weightBold,
            ),
          ),
          Text(
            info,
            style: opensansTextStyle.copyWith(
              fontSize: 10,
              fontWeight: weightBold,
            ),
          ),
        ],
      ),
    );
  }
}
