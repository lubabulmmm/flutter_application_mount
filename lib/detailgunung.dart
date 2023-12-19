// import 'package:flutter/material.dart';
// // import 'package:flutter_application_mount/detail_gunung.dart';

// class FavoritePage extends StatefulWidget {
//   const FavoritePage({super.key});

//   @override
//   State<FavoritePage> createState() => _FavoritePageState();
// }

// class _FavoritePageState extends State<FavoritePage> {
//   bool isFavorite = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Favorit',
//             style: TextStyle(
//               color: Colors.white,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.black,
//         ),
//         backgroundColor: Colors.black,
//         body: Container(
//           decoration: BoxDecoration(
//             border: Border.all(
//               width: 20.0,
//             ),
//             borderRadius: BorderRadius.circular(30.0),
//             color: const Color.fromARGB(24, 90, 93, 255),
//           ),
//           child: SingleChildScrollView(
//             child: Container(
//               width: double.infinity,
//               padding:
//                   const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
//               child: Column(
//                 children: <Widget>[
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.only(right: 10),
//                         width: 120,
//                         height: 120,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10.0),
//                           child: SizedBox.fromSize(
//                             child: Image.network(
//                               'https://drive.google.com/uc?export=view&id=12kfMyVKLgcqBV2NaIbzeHfykCcZ1QKit',
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 15.0),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 const Text(
//                                   'Nama',
//                                   style: TextStyle(
//                                     fontFamily: 'Poppins',
//                                     fontWeight: FontWeight.w700,
//                                     fontSize: 20,
//                                     color: Color.fromARGB(255, 252, 252, 252),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 130.0),
//                                 GestureDetector(
//                                   onTap: () {
//                                     // Ubah status favorit
//                                     setState(() {
//                                       isFavorite = !isFavorite;
//                                     });
//                                   },
//                                   child: Icon(
//                                     isFavorite
//                                         ? Icons.favorite
//                                         : Icons.favorite_border,
//                                     color: isFavorite
//                                         ? Colors.red // Warna merah jika favorit
//                                         : Colors
//                                             .white, // Outline putih jika tidak favorit
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10.0),
//                             const Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Icon(
//                                   Icons.location_on_outlined,
//                                   size: 15,
//                                   color: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                                 SizedBox(
//                                   width: 10.0,
//                                 ),
//                                 Text(
//                                   'Lokasi',
//                                   style: TextStyle(
//                                     color: Color.fromARGB(255, 255, 255, 255),
//                                     fontSize: 12,
//                                     fontFamily: "Poppins",
//                                     fontWeight: FontWeight.w300,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10.0),
//                             const Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Icon(
//                                   Icons.favorite_border_outlined,
//                                   size: 15,
//                                   color: Color.fromARGB(255, 255, 255, 255),
//                                 ),
//                                 SizedBox(
//                                   width: 10.0,
//                                 ),
//                                 Text(
//                                   'Disukai Oleh ... Orang',
//                                   style: TextStyle(
//                                     color: Color.fromARGB(255, 255, 255, 255),
//                                     fontSize: 10,
//                                     fontFamily: "Poppins",
//                                     fontWeight: FontWeight.w300,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 10.0),
//                             GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const Detail(),
//                                   ),
//                                 );
//                               },
//                               child: const Text(
//                                 'Lihat Detail',
//                                 style: TextStyle(
//                                   color: Color.fromARGB(255, 0, 242, 255),
//                                   fontSize: 12,
//                                   fontFamily: "Poppins",
//                                   fontWeight: FontWeight.w300,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ));
//   }
// }
