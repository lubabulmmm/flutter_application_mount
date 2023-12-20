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
        title: const Text(
          'Berita Gunung',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0F1A1A),
      ),
      backgroundColor: Colors.black,
      body: Column(
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
                    Text(
                      widget.judul,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Color.fromARGB(255, 252, 252, 252),
                      ),
                    ),
                    // const Spacer(),
                    // MouseRegion(
                    //   cursor: SystemMouseCursors.click,
                    //   child: IconButton(
                    //     icon: Icon(
                    //       widget.gunungs.isFavorite
                    //           ? Icons.favorite
                    //           : Icons.favorite_border_outlined,
                    //       color: widget.gunungs.isFavorite
                    //           ? Colors.red
                    //           : Colors.white,
                    //     ),
                    //     onPressed: () {
                    //       setState(() {
                    //         widget.gunungs.isFavorite =
                    //             !widget.gunungs.isFavorite;
                    //       });
                    //       // Handle button click
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_on_outlined,
                      size: 22,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      widget.sumber,
                      style: TextStyle(
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
                    Text(
                      'Deskripsi',
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
                      style: TextStyle(
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
    );
  }
}
