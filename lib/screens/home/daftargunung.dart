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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Daftar Gunung',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 0, 83),
      ),

      //! <<--------Daftar Gunung--------->>

      body: Container(
        color: const Color(0xFF000000),
        child: StreamBuilder(
            stream: _favListMount.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documents =
                        streamSnapshot.data!.docs[index];

                    Future<dynamic> addToFavorite() async {
                      FirebaseAuth _auth = FirebaseAuth.instance;
                      var currentUser = _auth.currentUser;
                      CollectionReference _collectionReference =
                          FirebaseFirestore.instance.collection('fav-user');

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Berhasil Menambahkan ke Favorit')));

                      return _collectionReference
                          .doc(currentUser!.email)
                          .collection('items')
                          .doc()
                          .set({
                        "nama": documents['nama'],
                        "lokasi": documents['lokasi'],
                        "pict": documents['pict'],
                        "desc": documents['desc'],
                        "jam": documents['jam'],
                        "tiket": documents['tiket']
                      }).then((value) => print('Ditambahkan ke favorit'));
                    }

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
                            color: const Color(0xFF0F1A1A),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                            "https://drive.google.com/uc?export=view&id=${documents['pict']}")),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            documents['nama'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                          ),
                                          Spacer(),
                                          StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection('fav-user')
                                                .doc(FirebaseAuth.instance
                                                    .currentUser!.email)
                                                .collection('items')
                                                .where('nama',
                                                    isEqualTo:
                                                        documents['nama'])
                                                .snapshots(),
                                            builder: (context,
                                                AsyncSnapshot snapshot) {
                                              return MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: IconButton(
                                                  icon: snapshot.data.docs
                                                              .length ==
                                                          0
                                                      ? Icon(
                                                          Icons
                                                              .favorite_outline,
                                                          color:
                                                              Colors.red[800],
                                                        )
                                                      : Icon(Icons.favorite,
                                                          color:
                                                              Colors.red[800]),
                                                  color: Colors.red,
                                                  onPressed: addToFavorite,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            documents['lokasi'],
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            )));
                  },
                );
              }

              return const Text('Tidak ada data');
            }),
      ),
    );
  }
}
