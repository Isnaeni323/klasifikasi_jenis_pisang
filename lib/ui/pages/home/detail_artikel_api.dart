import 'package:flutter/material.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';

class DetailArtikel extends StatelessWidget {
  //const DetailArtikel({Key? key}) : super(key: key);

  final url;
  final title;
  final image;
  final content;
  final author;
  final publishedAt;

  DetailArtikel({
    this.url,
    this.title,
    this.image,
    this.content,
    this.author,
    this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Detail Artikel',
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
      body: Column(
        children: <Widget>[
          image != null
              ? Image.network(image)
              : Container(
                  height: 250,
                  color: whiteColor,
                ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '$publishedAt',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 5),
                Text('$content'),
                Divider(),
                Text('Author : $author'),
                Text('$url'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
