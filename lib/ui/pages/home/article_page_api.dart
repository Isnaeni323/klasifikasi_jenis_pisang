import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final _baseUrl =
      'https://gnews.io/api/v4/search?q=banana variety&lang=en&apikey=9bafcb2a381f4ac20c0c2f4e68be89ab';

  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Article')),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Article',
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
      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: whiteColor,
              height: 100,
              width: 100,
              child: _posts[index]['image'] != null
                  ? Image.network(
                      _posts[index]['image'],
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Center(),
            ),
            title: Text(
              '${_posts[index]['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              '${_posts[index]['description']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () async {
              final Uri web = Uri.parse('${_posts[index]['url']}');
              launchUrl(web);
            },
          );
        },
      ),
    );
  }

  // Future<void> _openNewsUrl(Uri url) async {
  //   //await launchUrlString(url);
  //   //final url = Uri.parse($url)
  //   if (await canLaunchUrl(url)) {
  //     await launchUrl(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
        print(_posts);
      }
    } catch (e) {
      print(e.toString( ));
    }
  }
}
