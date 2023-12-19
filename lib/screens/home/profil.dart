import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_mount/screens/authenticate/login.dart';
import 'package:flutter_application_mount/screens/home/editprofil.dart';
import 'package:flutter_application_mount/screens/home/favoritscreen.dart';
import 'package:flutter_application_mount/screens/home/homescreen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_mount/service/auth.dart';
import 'package:provider/provider.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);
  @override
  State createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
// class ProfileScreen extends StatelessWidget {
  // ProfileScreen({Key? key}) : super(key: key);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF0F1A1A),
        centerTitle: true,
        title: const Text('Profil'),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('assets/fotopp.jpg'),
                ),
                SizedBox(height: 20),
                Text(
                  'Azizi Mau Naik Gunung',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'azizi123@gmail.com',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 70),
            // Bagian Tombol Navigasi
            Container(
              margin: const EdgeInsets.only(bottom: 150),
              child: Column(
                children: [
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigasi ke halaman Favorit
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const EditProfil()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors
                            .transparent), // Set background color to transparent
                        elevation: MaterialStateProperty.all<double>(
                            0), // Remove the shadow
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                            // Set border radius to 0
                          ),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.edit,
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Edit Profil                                          >',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Poppins',
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Menampilkan dialog keluar
                  //     showDialog(
                  //       context: context,
                  //       builder: (BuildContext context) {
                  //         return AlertDialog(
                  //           title: const Text('Keluar'),
                  //           content: const Text(
                  //               'Apakah Anda yakin ingin keluar dari Mount Java?'),
                  //           actions: [
                  //             TextButton(
                  //               onPressed: () {
                  //                 Navigator.of(context).pop();
                  //               },
                  //               child: const Text('Batal'),
                  //             ),
                  //             TextButton(
                  //               onPressed: () async {
                  //                 await _auth.signOut();
                  //               },
                  //               child: const Text('Keluar'),
                  //             ),
                  //           ],
                  //         );
                  //       },
                  //     );
                  //   },
                  //   style: ButtonStyle(
                  //     backgroundColor: MaterialStateProperty.all<Color>(Colors
                  //         .transparent), // Set background color to transparent
                  //     elevation: MaterialStateProperty.all<double>(
                  //         0), // Remove the shadow
                  //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //       RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(0),
                  //       ),
                  //     ),
                  //   ),
                  //   child: const Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     children: [
                  //       Icon(
                  //         Icons.exit_to_app,
                  //       ),
                  //       SizedBox(width: 20),
                  //       Text(
                  //         'Keluar                                               >',
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.w300,
                  //             fontFamily: 'Poppins',
                  //             fontSize: 17),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color(0xFF0F1A1A),
      //   selectedItemColor: Colors.blueAccent,
      //   unselectedItemColor: Colors.white,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Beranda',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'Favorit',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profil',
      //     ),
      //   ],
      //   currentIndex: 2, // Set the current index to 2 to highlight 'Profil'
      //   onTap: (int index) {
      //     switch (index) {
      //       case 0:
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => HomeScreen()),
      //         );
      //         break;
      //       case 1:
      //         // Navigate to FavoritesScreen
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => FavoritesScreen()),
      //         );
      //         break;
      //       case 2:
      //         break;
      //     }
      //   },
      // ),
      floatingActionButton: _showFab
          ? FloatingActionButton(
              onPressed: () {},
              tooltip: 'Cari Film',
              elevation: _isVisible ? 0.0 : null,
              backgroundColor: Colors.amber[700],
              child: const Icon(Icons.search),
            )
          : null,

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
        color: Colors.red[900],
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Profile',
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              tooltip: 'Suka',
              icon: const Icon(Icons.favorite_border_outlined,
                  color: Colors.white),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const FavoritesScreen())),
            ),
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
