import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_mount/screens/home/detailgunung.dart';
import 'package:flutter_application_mount/screens/home/gunung.dart';

class DaftarGunung extends StatefulWidget {
  @override
  _DaftarGunungState createState() => _DaftarGunungState();
}

class _DaftarGunungState extends State<DaftarGunung> {
  bool isSettingsSelected = false;

  final CollectionReference _favListMount =
      FirebaseFirestore.instance.collection('fav-mount');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Daftar Gunung',
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
            stream: _favListMount.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documents =
                        streamSnapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              nama: documents['nama'],
                              tiket: documents['tiket'],
                              jam: documents['jam'],
                              desc: documents['desc'],
                              pict: documents['pict'],
                              lokasi: documents['lokasi'],
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
                                          "https://drive.google.com/uc?export=view&id=${documents['pict']}")),
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
                                          documents['nama'],
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
                                            documents['lokasi'],
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5.0, left: 8.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.grey,
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            documents['tiket'],
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              fontSize: 13,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(right: 40),
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
