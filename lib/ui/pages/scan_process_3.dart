import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:klasifikasi_jenis_pisang/shared/size_config.dart';
import 'package:klasifikasi_jenis_pisang/shared/theme.dart';
import 'package:klasifikasi_jenis_pisang/ui/pages/scan_process_3_detail.dart';

class ScanProcess3 extends StatefulWidget {
  const ScanProcess3({Key? key, required this.image, required this.pred})
      : super(key: key);
  final List? pred;
  final File? image;

  @override
  _ScanProcess3State createState() => _ScanProcess3State();
}

class _ScanProcess3State extends State<ScanProcess3> {
  bool isTips = true;
  List label = [
    'ambon',
    'cavendish',
    'kepok',
    'susu',
  ];

  // Threshold for determining if the prediction is a known banana type
  final double detectionThreshold = 0.8;

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget customAppBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        elevation: 0,
        backgroundColor: bgColor,
        toolbarHeight: getProportionateScreenHeight(50),
        centerTitle: true,
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(40)),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: yellowColor,
          ),
          child: Stack(
            children: [
              Center(
                child: Text(
                  'Result',
                  style: aclonicaTextStyle.copyWith(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: weightBold,
                    color: whiteColor,
                  ),
                ),
              ),
              Positioned(
                right: getProportionateScreenWidth(20),
                top: getProportionateScreenHeight(12),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/main', (route) => false),
                  child: Text(
                    'Done',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: weightBold,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (widget.pred == null || widget.pred!.isEmpty) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
          appBar: customAppBar(),
          body: Center(
            child: Text(
              'Gambar yang dipindai tidak dikenali sebagai pisang.',
              style: aclonicaTextStyle.copyWith(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: weightBold,
                color: greenColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    print('Label Prediksi: ${widget.pred![0]['label']}');

    // Check if the highest prediction confidence is above the threshold
    bool isBanana = widget.pred![0]['confidence'] > detectionThreshold;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: customAppBar(),
        body: isBanana
            ? (widget.pred![0]['label'] == label[0])
                ? ScanProcess3Detail(
                    image: widget.image,
                    pengertian:
                        'Pisang Ambon adalah salah satu varietas pisang yang paling populer di Indonesia. Pisang ini dikenal karena ukuran buahnya yang besar dan rasa yang manis serta aroma yang harum. \nKulit pisang Ambon berwarna hijau kekuningan dengan sedikit bercak coklat saat matang, dan daging buahnya berwarna putih kekuningan dengan tekstur yang lembut dan rasa manis yang khas.',
                    pengertianinggris:
                        'Ambon bananas are one of the most popular banana varieties in Indonesia. \nIt is known for its large fruit size and sweet flavor and fragrant aroma. \nThe skin of Ambon bananas is yellowish-green with slight brown patches when ripe, and the flesh is yellowish-white with a soft texture and distinctive sweet flavor.',
                    jenisPisang: 'ambon',
                    nutrisi:
                        'Pisang Ambon kaya akan vitamin C, B6, dan kalium. Pisang ini juga mengandung serat yang tinggi',
                    nutrisiinggris:
                        'Pisang Ambon is rich in vitamin C, B6, and potassium. It also has a high fiber content.',
                    asaldistribusi:
                        'Pisang Ambon berasal dari Indonesia dan tersebar luas di berbagai daerah tropis.',
                    asaldistribusiinggris:
                        'Pisang Ambon originates from Indonesia and is widely distributed in various tropical regions.',
                    reseppenggunaan:
                        'Pisang Ambon sering digunakan dalam pembuatan kue, smoothie, dan dimakan langsung sebagai camilan.',
                    reseppenggunaaninggris:
                        'Pisang Ambon is often used in baking, smoothies, and eaten directly as a snack.',
                    musim:
                        'Pisang Ambon tersedia sepanjang tahun, namun puncak panennya biasanya terjadi di musim kemarau.',
                    musiminggris:
                        'Pisang Ambon is available year-round, but its peak harvest season usually occurs during the dry season.',
                    tipsmenyimpan:
                        'Simpan pisang Ambon di suhu ruangan, hindari sinar matahari langsung. Untuk mempercepat pematangan, simpan dalam kantong kertas.',
                    tipsmenyimpaninggris:
                        'Store Pisang Ambon at room temperature, avoiding direct sunlight. To speed up ripening, store in a paper bag.',
                    manfaat:
                        'Pisang Ambon dapat membantu pencernaan, meningkatkan energi, dan mengurangi risiko penyakit jantung.',
                    manfaatinggris:
                        'Pisang Ambon can aid digestion, boost energy, and reduce the risk of heart disease.',
                    disclaimer:
                        'Hasil identifikasi pisang yang diberikan oleh aplikasi BananaClassify bersifat indikatif dan mungkin tidak sepenuhnya akurat.',
                    disclaimeringgris:
                        'The banana identification results provided by the BananaClassify app are indicative and may not be completely accurate.',
                  )
                : (widget.pred![0]['label'] == label[1])
                    ? ScanProcess3Detail(
                        image: widget.image,
                        pengertian:
                            'Pisang Cavendish adalah salah satu varietas pisang yang paling populer dan banyak dibudidayakan di seluruh dunia. \nPisang ini memiliki bentuk yang panjang dengan kulit berwarna kuning cerah saat matang. \nDaging buahnya berwarna putih krem dengan tekstur yang lembut dan rasa yang manis.',
                        pengertianinggris:
                            'Cavendish bananas are one of the most popular and widely cultivated banana varieties around the world. \nIt has a long shape with a bright yellow skin when ripe. \nThe flesh is creamy white with a soft texture and sweet flavor.',
                        jenisPisang: 'cavendish',
                        nutrisi:
                            'Pisang Cavendish kaya akan vitamin B6, vitamin C, dan serat. Juga mengandung magnesium dan kalium.',
                        nutrisiinggris:
                            'Pisang Cavendish is rich in vitamin B6, vitamin C, and fiber. It also contains magnesium and potassium.',
                        asaldistribusi:
                            'Pisang Cavendish berasal dari wilayah tropis dan subtropis dan merupakan varietas yang paling umum di pasar global.',
                        asaldistribusiinggris:
                            'Pisang Cavendish originates from tropical and subtropical regions and is the most common variety in global markets.',
                        reseppenggunaan:
                            'Pisang Cavendish sering digunakan dalam pembuatan smoothie, kue, dan roti pisang.',
                        reseppenggunaaninggris:
                            'Pisang Cavendish is often used in smoothies, baking, and banana bread.',
                        musim: 'Pisang Cavendish tersedia sepanjang tahun.',
                        musiminggris:
                            'Pisang Cavendish is available year-round.',
                        tipsmenyimpan:
                            'Simpan pisang Cavendish di suhu ruangan untuk pematangan yang optimal. Untuk penyimpanan lebih lama, simpan di lemari es.',
                        tipsmenyimpaninggris:
                            'Store Pisang Cavendish at room temperature for optimal ripening. For longer storage, keep in the refrigerator.',
                        manfaat:
                            'Pisang Cavendish dapat membantu menjaga tekanan darah, mendukung kesehatan pencernaan, dan menyediakan energi cepat.',
                        manfaatinggris:
                            'Pisang Cavendish can help maintain blood pressure, support digestive health, and provide quick energy.',
                        disclaimer:
                            'Hasil identifikasi pisang yang diberikan oleh aplikasi BananaClassify bersifat indikatif dan mungkin tidak sepenuhnya akurat.',
                        disclaimeringgris:
                            'The banana identification results provided by the BananaClassify app are indicative and may not be completely accurate.',
                      )
                    : (widget.pred![0]['label'] == label[2])
                        ? ScanProcess3Detail(
                            image: widget.image,
                            pengertian:
                                'Pisang Kepok, atau dikenal juga sebagai pisang Raja Bulu, adalah varietas pisang yang memiliki ciri khas kulit tebal dan tahan lama setelah dipanen. \nPisang ini memiliki bentuk yang lebih besar dan berwarna kuning keemasan saat matang. \nDaging buahnya berwarna putih dengan tekstur yang padat dan rasa manis yang sedikit asam.',
                            pengertianinggris:
                                'Pisang Kepok, also known as Raja Bulu banana, is a variety of banana characterized by a thick skin and a long shelf life after harvest. \nIt has a larger shape and is golden yellow in color when ripe. \nThe flesh is white with a dense texture and a slightly tangy sweet taste.',
                            jenisPisang: 'kepok',
                            nutrisi:
                                'Pisang Kepok mengandung vitamin B6, vitamin C, serta sejumlah mineral seperti kalium dan magnesium.',
                            nutrisiinggris:
                                'Pisang Kepok contains vitamin B6, vitamin C, and several minerals such as potassium and magnesium.',
                            asaldistribusi:
                                'Pisang Kepok berasal dari Asia Tenggara dan banyak ditemukan di Indonesia serta negara-negara sekitarnya.',
                            asaldistribusiinggris:
                                'Pisang Kepok originates from Southeast Asia and is commonly found in Indonesia and surrounding countries.',
                            reseppenggunaan:
                                'Pisang Kepok sering digunakan untuk membuat keripik pisang, kolak, dan berbagai hidangan tradisional.',
                            reseppenggunaaninggris:
                                'Pisang Kepok is often used to make banana chips, compote, and various traditional dishes.',
                            musim:
                                'Pisang Kepok tersedia sepanjang tahun dengan puncak panen di musim kemarau.',
                            musiminggris:
                                'Pisang Kepok is available year-round with a peak harvest season during the dry season.',
                            tipsmenyimpan:
                                'Simpan pisang Kepok di suhu ruangan untuk pematangan yang optimal. Pisang ini juga dapat disimpan di lemari es untuk memperpanjang masa simpannya.',
                            tipsmenyimpaninggris:
                                'Store Pisang Kepok at room temperature for optimal ripening. It can also be stored in the refrigerator to extend its shelf life.',
                            manfaat:
                                'Pisang Kepok dapat membantu menjaga kesehatan pencernaan, meningkatkan energi, dan mengandung antioksidan yang baik untuk tubuh.',
                            manfaatinggris:
                                'Pisang Kepok can help maintain digestive health, boost energy, and contains antioxidants that are good for the body.',
                            disclaimer:
                                'Hasil identifikasi pisang yang diberikan oleh aplikasi BananaClassify bersifat indikatif dan mungkin tidak sepenuhnya akurat.',
                            disclaimeringgris:
                                'The banana identification results provided by the BananaClassify app are indicative and may not be completely accurate.',
                          )
                        : (widget.pred![0]['label'] == label[3])
                            ? ScanProcess3Detail(
                                image: widget.image,
                                pengertian:
                                    'Pisang Susu adalah varietas pisang yang memiliki ukuran buah yang lebih kecil dibandingkan varietas lainnya. \nPisang ini dikenal dengan rasa yang sangat manis dan aroma yang harum. \nKulit pisang Susu berwarna kuning cerah saat matang dengan bintik-bintik coklat kecil.',
                                pengertianinggris:
                                    'Pisang Susu is a variety of banana that has a smaller fruit size compared to other varieties. \nIt is known for its very sweet taste and fragrant aroma. \nThe skin of Pisang Susu is bright yellow when ripe with small brown spots.',
                                jenisPisang: 'susu',
                                nutrisi:
                                    'Pisang Susu kaya akan vitamin C, B6, dan serat. Juga mengandung kalium dan magnesium.',
                                nutrisiinggris:
                                    'Pisang Susu is rich in vitamin C, B6, and fiber. It also contains potassium and magnesium.',
                                asaldistribusi:
                                    'Pisang Susu berasal dari Indonesia dan banyak dibudidayakan di berbagai daerah tropis.',
                                asaldistribusiinggris:
                                    'Pisang Susu originates from Indonesia and is widely cultivated in various tropical regions.',
                                reseppenggunaan:
                                    'Pisang Susu sering dimakan langsung sebagai buah segar atau digunakan dalam pembuatan kue dan makanan penutup.',
                                reseppenggunaaninggris:
                                    'Pisang Susu is often eaten directly as a fresh fruit or used in baking and desserts.',
                                musim:
                                    'Pisang Susu tersedia sepanjang tahun dengan puncak panen di musim hujan.',
                                musiminggris:
                                    'Pisang Susu is available year-round with a peak harvest season during the rainy season.',
                                tipsmenyimpan:
                                    'Simpan pisang Susu di suhu ruangan untuk pematangan yang optimal. Pisang ini juga dapat disimpan di lemari es untuk memperpanjang masa simpannya.',
                                tipsmenyimpaninggris:
                                    'Store Pisang Susu at room temperature for optimal ripening. It can also be stored in the refrigerator to extend its shelf life.',
                                manfaat:
                                    'Pisang Susu dapat membantu meningkatkan energi, mendukung kesehatan pencernaan, dan mengandung antioksidan yang baik untuk tubuh.',
                                manfaatinggris:
                                    'Pisang Susu can help boost energy, support digestive health, and contains antioxidants that are good for the body.',
                                disclaimer:
                                    'Hasil identifikasi pisang yang diberikan oleh aplikasi BananaClassify bersifat indikatif dan mungkin tidak sepenuhnya akurat.',
                                disclaimeringgris:
                                    'The banana identification results provided by the BananaClassify app are indicative and may not be completely accurate.',
                              )
                            : Container(
                                child: Center(
                                  child: Text(
                                    'Gambar yang dipindai tidak dikenali sebagai jenis pisang yang diketahui.',
                                    style: aclonicaTextStyle.copyWith(
                                      fontSize: getProportionateScreenWidth(16),
                                      fontWeight: weightBold,
                                      color: greenColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              )
            : Container(
                child: Center(
                  child: Text(
                    'Gambar yang dipindai tidak dikenali sebagai pisang.',
                    style: aclonicaTextStyle.copyWith(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: weightBold,
                      color: greenColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
      ),
    );
  }
}
