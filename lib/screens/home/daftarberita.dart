// import 'package:flutter/material.dart';
// import 'package:flutter_application_mount/screens/home/berita.dart';
// import 'package:flutter_application_mount/screens/home/detailberita.dart';

// class DaftarBerita extends StatefulWidget {
//   @override
//   _DaftarBeritaState createState() => _DaftarBeritaState();
// }

// class _DaftarBeritaState extends State<DaftarBerita> {
//   bool isSettingsSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(child: Text('Daftar berita')),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Color(0xFF0F1A1A),
//       ),
//       body: Container(
//         color: Color(0xFF000000),
//         child: ListView.builder(
//           itemCount: dataBerita.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DetailScreenBerita(
//                       beritaa: dataBerita[index],
//                     ),
//                   ),
//                 );
//               },
//               child: Card(
//                 color: Color(0xFF0F1A1A),
//                 child: Container(
//                   width: 200,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(
//                             dataBerita[index].image,
//                             width: 100,
//                             height: 100,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   dataBerita[index].judul,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontFamily: "Montserrat",
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 5.0),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 Icon(
//                                   Icons.location_on_outlined,
//                                   color:
//                                       Colors.grey, // Set the icon color to gray
//                                 ),
//                                 const SizedBox(width: 2),
//                                 Text(
//                                   dataBerita[index].sumber,
//                                   style: TextStyle(
//                                     color: Colors
//                                         .grey, // Set the text color to gray
//                                     fontFamily: 'Poppins', // Use Poppins font
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_mount/screens/home/detailberita.dart';
import 'package:flutter_application_mount/screens/home/detailgunung.dart';
import 'package:flutter_application_mount/screens/home/gunung.dart';

class DaftarBeritaGunung extends StatefulWidget {
  @override
  _DaftarBeritaGunungState createState() => _DaftarBeritaGunungState();
}

class _DaftarBeritaGunungState extends State<DaftarBeritaGunung> {
  bool isSettingsSelected = false;

  final CollectionReference _newsMount =
      FirebaseFirestore.instance.collection('news');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Berita Gunung',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xFF0F1A1A),
      ),
      body: Container(
        color: Color(0xFF000000),
        child: StreamBuilder(
            stream: _newsMount.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshott) {
              if (streamSnapshott.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshott.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot dokumen =
                        streamSnapshott.data!.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailBeritaScreen(
                              pict: dokumen['pict'],
                              judul: dokumen['judul'],
                              sumber: dokumen['sumber'],
                              isi: dokumen['isi'],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Color(0xFF0F1A1A),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                          "https://drive.google.com/uc?export=view&id=${dokumen['pict']}")),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          dokumen['judul'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                          ),
                                        ),
                                        // MouseRegion(
                                        //   cursor: SystemMouseCursors.click,
                                        //   child: IconButton(
                                        //     icon: Icon(
                                        //       dataResep[index].isFavorite
                                        //           ? Icons.favorite
                                        //           : Icons
                                        //               .favorite_border_outlined,
                                        //       color: dataResep[index].isFavorite
                                        //           ? Colors.red
                                        //           : Colors.white,
                                        //     ),
                                        //     onPressed: () {
                                        //       setState(() {
                                        //         dataResep[index].isFavorite =
                                        //             !dataResep[index]
                                        //                 .isFavorite;
                                        //       });
                                        //       // Handle button click
                                        //     },
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5.0, left: 8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            dokumen['sumber'],
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
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
                  },
                );
              }

              return Text('Tidak ada data');
            }),
      ),
    );
  }
}
