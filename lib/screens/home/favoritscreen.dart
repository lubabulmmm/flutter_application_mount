import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_mount/screens/home/detailgunung.dart';
import 'package:flutter_application_mount/screens/home/homescreen.dart';
import 'package:flutter_application_mount/screens/home/profil.dart';
import 'package:flutter_application_mount/screens/home/gunung.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool isFavorite = false;
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
  } // Add this line to define isFavorite

  final CollectionReference _favListUser = FirebaseFirestore.instance
      .collection('fav-user')
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection('items');

  Future<void> _deleteItems(String itemsID) async {
    await _favListUser.doc(itemsID).delete();

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Berhasil Menghapus Dari Favorite')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 0, 83),
      ),

      //! <<--------Daftar Gunung yang di Favoritkan--------->>

      body: Container(
        color: Color(0xFF000000),
        child: StreamBuilder(
            stream: _favListUser.snapshots(),
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
                        color: const Color(0xFF0F1A1A),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      "https://drive.google.com/uc?export=view&id=${documents['pict']}",
                                    ),
                                  ),
                                ), // fit: BoxFit.cover,
                              ),
                              SizedBox(width: 30),
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
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                          ),
                                        ),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              // Handle button click
                                              _favListUser
                                                  .doc(documents.id)
                                                  .delete();

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      content: Text(
                                                          'Berhasil Menghapus Dari Favorite')));
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 2),
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
              return Text('no data');
            }),
      ),
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
        color: const Color.fromARGB(255, 6, 0, 83),
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
                      builder: (BuildContext context) => ProfilScreen())),
            ),

            // SPACER
            Spacer(),

            // Favorit
            IconButton(
              tooltip: 'Favorit',
              icon: const Icon(Icons.favorite_border_outlined,
                  color: Colors.white),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const FavoritesScreen())),
            ),

            // SPACER
            Spacer(),

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
