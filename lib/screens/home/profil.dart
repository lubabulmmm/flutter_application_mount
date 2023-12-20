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

  final username = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 0, 83),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('assets/fotopp.jpg'),
                ),
                SizedBox(height: 20),
                Text(
                  '${username}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 70),
            // // Bagian Tombol Navigasi
            // Container(
            //   margin: const EdgeInsets.only(bottom: 150),
            //   child: Column(
            //     children: [
            //       Container(
            //         child: ElevatedButton(
            //           onPressed: () {
            //             // Navigasi ke halaman Favorit
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (BuildContext context) =>
            //                       const EditProfil()),
            //             );
            //           },
            //           style: ButtonStyle(
            //             backgroundColor: MaterialStateProperty.all<Color>(Colors
            //                 .transparent), // Set background color to transparent
            //             elevation: MaterialStateProperty.all<double>(
            //                 0), // Remove the shadow
            //             shape:
            //                 MaterialStateProperty.all<RoundedRectangleBorder>(
            //               RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(0),
            //                 // Set border radius to 0
            //               ),
            //             ),
            //           ),
            //           child: const Row(
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Icon(
            //                 Icons.edit,
            //               ),
            //               SizedBox(width: 20),
            //               Text(
            //                 'Edit Profil                                          >',
            //                 style: TextStyle(
            //                     color: Colors.white,
            //                     fontWeight: FontWeight.w300,
            //                     fontFamily: 'Poppins',
            //                     fontSize: 17),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),

            //     ],
            //   ),
            // ),
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
        color: const Color.fromARGB(255, 6, 0, 83),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, // Center buttons with space around
          children: <Widget>[
            //! PROFIL
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

            //! FAVORITE
            IconButton(
              tooltip: 'Favorit',
              icon: const Icon(Icons.favorite_border_outlined,
                  color: Colors.white),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const FavoritesScreen())),
            ),

            // SPACER
            Spacer(),

            //! HOME
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
