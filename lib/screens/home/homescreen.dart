import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_mount/screens/home/berita.dart';
import 'package:flutter_application_mount/screens/home/daftarberita.dart';
import 'package:flutter_application_mount/screens/home/detailgunung.dart';
import 'package:flutter_application_mount/screens/home/detailberita.dart';
import 'package:flutter_application_mount/screens/home/favoritscreen.dart';
import 'package:flutter_application_mount/screens/home/gunung.dart';
import 'package:flutter_application_mount/screens/home/daftargunung.dart';
import 'package:flutter_application_mount/screens/home/profil.dart';
import 'package:flutter_application_mount/service/auth.dart';
// import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State createState() => HomeState();
}

// class AuthService {
//   // final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Sign out method

// }

class HomeState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  late ScrollController _controller;
  bool _showFab = true;
  bool _isElevated = true;
  bool _isVisible = true;

  FloatingActionButtonLocation get _fabLocation => _isVisible
      ? FloatingActionButtonLocation.endContained
      : FloatingActionButtonLocation.endFloat;

  void _listen() {
    final ScrollDirection direction = _controller.position.userScrollDirection;
    if (direction == ScrollDirection.forward) {
      _show();
    } else if (direction == ScrollDirection.reverse) {
      _hide();
    }
  }

  void _show() {
    if (!_isVisible) {
      setState(() => _isVisible = true);
    }
  }

  void _hide() {
    if (_isVisible) {
      setState(() => _isVisible = false);
    }
  }

  void _onShowFabChanged(bool value) {
    setState(() {
      _showFab = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_listen);
  }

  @override
  void dispose() {
    _controller.removeListener(_listen);
    _controller.dispose();
    super.dispose();
  }

  final CollectionReference _favListMount =
      FirebaseFirestore.instance.collection('fav-mount');
  final CollectionReference _newsMount =
      FirebaseFirestore.instance.collection('news');

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> _confirmSignOut() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: const Text('Anda yakin ingin keluar?'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _auth.signOut();
              },
              child: const Text('Ya'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tidak'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 0, 83),
        centerTitle: true, //untuk mengubah text beranda tengah
        title: const Text(
          'Beranda',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              _confirmSignOut();
            },
            child: const Text('Keluar'),
          )
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: ListView(
          children: [
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  List<String> imageList = [
                    'https://drive.google.com/uc?export=view&id=1ZUlmobYqYC77Eu5cXoXy6mBw3B4ikDR0',
                    'https://drive.google.com/uc?export=view&id=1BN6DCfM3cAMOQhTGNPKjFY115Folv1iT',
                    'https://drive.google.com/uc?export=view&id=1eia4odabZB2890SwYOfrGYe56WJ4bBT7',
                    'https://drive.google.com/uc?export=view&id=1eia4odabZB2890SwYOfrGYe56WJ4bBT7',
                    'https://drive.google.com/uc?export=view&id=1ZUlmobYqYC77Eu5cXoXy6mBw3B4ikDR0',
                  ];

                  return Container(
                    width: 300,
                    height: 700,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(imageList[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            // ! <<------ Daftar Gunung------>>
//tampilan daftar gunung berada di tengah dan lainnya di samping
            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Daftar Gunung',
            //         style: TextStyle(
            //           fontFamily: 'Monserrat',
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //           color: Color.fromARGB(255, 255, 255, 255),
            //         ),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           TextButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => DaftarGunung()),
            //               );
            //             },
            //             child: Text(
            //               'Lainnya',
            //               style: TextStyle(
            //                 fontFamily: 'Monserrat',
            //                 fontWeight: FontWeight.w500,
            //                 color: Color.fromARGB(255, 0, 119, 255),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Daftar Gunung',
                    style: TextStyle(
                      fontFamily: 'Monserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DaftarGunung()),
                      );
                    },
                    child: const Text(
                      'Lainnya',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 119, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Mountain List
            Container(
              height: 280,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: StreamBuilder(
                  stream: _favListMount.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: streamSnapshot.data!.docs.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                              width:
                                  5.0); // Adjust the width according to your preference
                        },
                        itemBuilder: (context, index) {
                          final DocumentSnapshot documents =
                              streamSnapshot.data!.docs[index];

                          Future<dynamic> addToFavorite() async {
                            FirebaseAuth _auth = FirebaseAuth.instance;
                            var currentUser = _auth.currentUser;
                            CollectionReference _collectionReference =
                                FirebaseFirestore.instance
                                    .collection('fav-user');

                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Berhasil Menambahkan ke Favorit')));

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
                              color: const Color(0xFF000000),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F1A1A),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                              "https://drive.google.com/uc?export=view&id=${documents['pict']}")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 8.0,
                                        top: 8.0,
                                        right: 8.0,
                                        left: 12.0,
                                      ),
                                      child: Text(
                                        documents['nama'],
                                        style: const TextStyle(
                                          fontFamily: 'Monserrat',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on_outlined,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 6),
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
                                    ),
                                    Row(
                                      children: [
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
                                              return IconButton(
                                                onPressed: addToFavorite,
                                                icon: snapshot
                                                            .data.docs.length ==
                                                        0
                                                    ? Icon(
                                                        Icons.favorite_outline,
                                                        color: Colors.red[800],
                                                      )
                                                    : Icon(Icons.favorite,
                                                        color: Colors.red[800]),
                                                color: Colors.red,
                                              );
                                            }),
                                        // const SizedBox(width: 2),
                                        const Text(
                                          'Favorit',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 40),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const Text('Tidak ada data');
                  }),
            ),

            //! <<------Daftar Berita----->>

            // Container(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Berita',
            //         style: TextStyle(
            //           fontFamily: 'Monserrat',
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //           color: Color.fromARGB(255, 255, 255, 255),
            //         ),
            //       ),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.end,
            //         children: [
            //           TextButton(
            //             onPressed: () {
            //               Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                     builder: (context) => DaftarGunung()),
            //               );
            //             },
            //             child: Text(
            //               'Lainnya',
            //               style: TextStyle(
            //                 fontFamily: 'Monserrat',
            //                 fontWeight: FontWeight.w500,
            //                 color: Color.fromARGB(255, 0, 119, 255),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Berita',
                    style: TextStyle(
                      fontFamily: 'Monserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DaftarBeritaGunung()),
                      );
                    },
                    child: const Text(
                      'Lainnya',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 119, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 280,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: StreamBuilder(
                  stream: _newsMount.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshott) {
                    if (streamSnapshott.hasData) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: streamSnapshott.data!.docs.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                              width:
                                  5.0); // Adjust the width according to your preference
                        },
                        itemBuilder: (context, index) {
                          final DocumentSnapshot dokumen =
                              streamSnapshott.data!.docs[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailBeritaScreen(
                                    judul: dokumen['judul'],
                                    pict: dokumen['pict'],
                                    sumber: dokumen['sumber'],
                                    isi: dokumen['isi'],
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              color: const Color(0xFF000000),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0F1A1A),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                              "https://drive.google.com/uc?export=view&id=${dokumen['pict']}")),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 5.0,
                                        top: 8.0,
                                        right: 8.0,
                                        left: 12.0,
                                      ),
                                      child: Text(
                                        dokumen['judul'],
                                        style: const TextStyle(
                                          fontFamily: 'Monserrat',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 5.0, left: 8.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.article_outlined,
                                            color: Colors.grey,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            dokumen['sumber'],
                                            style: const TextStyle(
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
                            ),
                          );
                        },
                      );
                    }
                    return const Text('Tidak ada data');
                  }),
            ),
          ],
        ),
      ),

      //! <<----------Nav Bottom Bar------->>

      floatingActionButtonLocation: _fabLocation,
      bottomNavigationBar:
          _DemoBottomAppBar(isElevated: _isElevated, isVisible: _isVisible),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    required this.isElevated,
    required this.isVisible,
  });

  final bool isElevated;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: isVisible ? 80.0 : 0,
      child: BottomAppBar(
        elevation: isElevated ? null : 0.0,
        color: Color.fromARGB(255, 6, 0, 83),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Center buttons with space around
          children: <Widget>[
            // PROFIL
            IconButton(
              tooltip: 'Profil Kamu',
              icon: const Icon(
                Icons.person_2_sharp,
                color: Colors.white,
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const ProfilScreen())),
            ),

            // SPACER
            const Spacer(),
            //Favorite
            IconButton(
              tooltip: 'Favorit',
              icon: const Icon(Icons.favorite_border_outlined,
                  color: Colors.white),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const FavoritesScreen())),
            ),

            // SPACER
            const Spacer(),

            // HOME
            IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home_filled, color: Colors.white),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const HomeScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
