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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, // Add this line to hide the back button
        backgroundColor: Color.fromARGB(255, 98, 62, 1),
        centerTitle: true,
        title: Text(
          'Daftar Gunung',
          style: TextStyle(
            fontSize: 20.0,
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(Icons.logout_outlined),
            iconSize: 30.0,
            color: Colors.amber,
          )
        ],
      ),

      body: Container(
        color: Color.fromARGB(255, 0, 0, 0),
        child: ListView(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Cari',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Image Slider (Gunung)
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  List<String> imageList = [
                    'assets/Poster(1).jpeg',
                    'assets/Poster(2).jpeg',
                    'assets/Poster(3).jpg',
                  ];
                  return Container(
                    width: 300,
                    height: 700,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(imageList[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            // List of Mountains
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daftar Gunung',
                    style: TextStyle(
                      fontFamily: 'Monserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DaftarGunung()),
                      );
                    },
                    child: Text(
                      'Lainnya',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Mountain List
            Container(
              height: 260,
              child: StreamBuilder(
                  stream: _favListMount.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
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
                              color: Color(0xFF000000),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 84, 65, 1),
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
                                        bottom: 5.0,
                                        top: 8.0,
                                        left: 12.0,
                                      ),
                                      child: Text(
                                        documents['nama'],
                                        style: TextStyle(
                                          fontFamily: 'Monserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
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
                                            Icons.favorite,
                                            color: Colors.red,
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
                            ),
                          );
                        },
                      );
                    }
                    return Text('Tidak ada data');
                  }),
            ),

            // List of News
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Berita',
                    style: TextStyle(
                      fontFamily: 'Monserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: const Color.fromARGB(255, 255, 255, 255),
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
                    child: Text(
                      'Lainnya',
                      style: TextStyle(
                        fontFamily: 'Monserrat',
                        fontWeight: FontWeight.w500,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // News List
            // Container(
            //   height: 230,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: dataBerita.length,
            //     itemBuilder: (context, index) {
            //       return GestureDetector(
            //         onTap: () {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => DetailScreenBerita(
            //                 beritaa: dataBerita[index],
            //               ),
            //             ),
            //           );
            //         },
            //         child: Card(
            //           color: Color.fromARGB(255, 88, 63, 2),
            //           child: Container(
            //             width: 250,
            //             decoration: BoxDecoration(
            //               color: Color(0xFF0F1A1A),
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //             child: Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 ClipRRect(
            //                   borderRadius: BorderRadius.circular(8),
            //                   child: Image.asset(
            //                     dataBerita[index].image,
            //                     width: 250,
            //                     height: 150,
            //                     fit: BoxFit.cover,
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(
            //                     bottom: 5.0,
            //                     top: 8.0,
            //                     left: 12.0,
            //                   ),
            //                   child: Text(
            //                     dataBerita[index].judul,
            //                     style: TextStyle(
            //                       fontFamily: 'Monserrat',
            //                       fontWeight: FontWeight.bold,
            //                       color: Colors.white,
            //                       fontSize: 16,
            //                     ),
            //                     overflow: TextOverflow.ellipsis,
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding:
            //                       const EdgeInsets.only(bottom: 5.0, left: 8.0),
            //                   child: Row(
            //                     children: [
            //                       Icon(
            //                         Icons.location_on_outlined,
            //                         color: Colors.grey,
            //                       ),
            //                       SizedBox(width: 8),
            //                       Text(
            //                         dataBerita[index].sumber,
            //                         style: TextStyle(
            //                           fontFamily: 'Poppins',
            //                           fontWeight: FontWeight.w300,
            //                           color: Colors.grey,
            //                           fontSize: 13,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),

            //         ),
            //       );
            //     },
            //   ),
            // ),

            Container(
              height: 260,
              child: StreamBuilder(
                  stream: _newsMount.snapshots(),
                  builder:
                      (context, AsyncSnapshot<QuerySnapshot> streamSnapshott) {
                    if (streamSnapshott.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
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
                                    judul: dokumen['judul'],
                                    pict: dokumen['pict'],
                                    sumber: dokumen['sumber'],
                                    isi: dokumen['isi'],
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              color: Color(0xFF000000),
                              child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 84, 65, 1),
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
                                        left: 12.0,
                                      ),
                                      child: Text(
                                        dokumen['judul'],
                                        style: TextStyle(
                                          fontFamily: 'Monserrat',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
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
                            ),
                          );
                        },
                      );
                    }
                    return Text('Tidak ada data');
                  }),
            ),
          ],
        ),
      ),
      // floatingActionButton: _showFab
      //     ? FloatingActionButton(
      //         onPressed: () {},
      //         tooltip: 'Cari Film',
      //         elevation: _isVisible ? 0.0 : null,
      //         backgroundColor: Colors.amber[700],
      //         child: const Icon(Icons.search),
      //       )
      // : null,
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
        color: Color.fromARGB(255, 84, 65, 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              tooltip: 'Profil Kamu',
              icon: const Icon(
                Icons.person_2_sharp,
                color: Colors.white,
              ),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => ProfilScreen(),
                ),
              ),
            ),
            Spacer(), // Add Spacer to create space between icons
            IconButton(
              tooltip: 'Suka',
              icon: const Icon(Icons.favorite_border_outlined,
                  color: Colors.white),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const FavoritesScreen(),
                ),
              ),
            ),
            Spacer(), // Add Spacer to create space between icons
            IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home_filled, color: Colors.white),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomeScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
