// import 'package:flutter/material.dart';
// import 'package:flutter_application_mount/screens/home/berita.dart';

// class DetailScreenBerita extends StatelessWidget {
//   final berita beritaa;

//   const DetailScreenBerita({Key? key, required this.beritaa}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Detail Berita'),
//         backgroundColor: Color(0xFF0F1A1A),
//       ),
//       backgroundColor: Colors.black,
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 250, // Tinggi gambar
//             width: double.infinity,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(beritaa.image),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       beritaa.judul,
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         fontFamily: 'Montserrat',
//                         fontWeight: FontWeight.w700,
//                         fontSize: 25,
//                       ),
//                     ),
//                     const SizedBox(height: 5.0),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Icon(
//                       Icons.article_outlined,
//                       size: 22,
//                       color: Color.fromARGB(255, 255, 255, 255),
//                     ),
//                     SizedBox(
//                       width: 10.0,
//                     ),
//                     Text(
//                       beritaa.sumber,
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         fontSize: 14,
//                         fontFamily: "Poppins",
//                         fontWeight: FontWeight.w300,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 5.0),
//                 const Divider(
//                   color: Color.fromARGB(255, 255, 255, 255),
//                   height: 20,
//                   thickness: 2,
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Deskripsi',
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         fontSize: 22,
//                         fontFamily: "Poppins",
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     const SizedBox(height: 5.0),
//                     Text(
//                       beritaa.deskripsi,
//                       style: TextStyle(
//                         color: Color.fromARGB(255, 255, 255, 255),
//                         fontSize: 15,
//                         fontFamily: "Poppins",
//                         fontWeight: FontWeight.w100,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_mount/screens/home/gunung.dart';

class DetailBeritaScreen extends StatefulWidget {
  final String isi;
  final String judul;
  final String pict;
  final String sumber;

  const DetailBeritaScreen({
    Key? key,
    required this.isi,
    required this.judul,
    required this.pict,
    required this.sumber,
  }) : super(key: key);

  @override
  _DetailBeritaScreenState createState() => _DetailBeritaScreenState();
}

class _DetailBeritaScreenState extends State<DetailBeritaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Detail Berita',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 6, 0, 83),
        ),

        //! <<---------Detail Berita-------->>

        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://drive.google.com/uc?export=view&id=${widget.pict}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 500,
                          child: Text(
                            widget.judul,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Color.fromARGB(255, 252, 252, 252),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Icon(
                          Icons.article_outlined,
                          size: 22,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          widget.sumber,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    const Divider(
                      color: Color.fromARGB(255, 255, 255, 255),
                      height: 20,
                      thickness: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Isi Berita',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 22,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          widget.isi,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 11,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
