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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF0F1A1A),
        centerTitle: true,
        title: const Text('Favorites'),
      ),
      body: Container(
        color: Color(0xFF000000),
        child: ListView.builder(
          itemCount: dataResep.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => DetailScreen(
                //       gunungs: dataResep[index],
                //     ),
                //   ),
                // );
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
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            dataResep[index].image,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dataResep[index].name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors
                                        .white, // Ubah warna teks menjadi putih
                                  ),
                                ),
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: IconButton(
                                    icon: Icon(
                                      dataResep[index].isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: dataResep[index].isFavorite
                                          ? Colors.red
                                          : Colors.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        dataResep[index].isFavorite =
                                            !dataResep[index].isFavorite;
                                      });
                                      // Handle button click
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 5.0, left: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    dataResep[index].lokasi,
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
                              padding:
                                  const EdgeInsets.only(bottom: 5.0, left: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    dataResep[index].rating,
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
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   backgroundColor: Color.fromARGB(255, 48, 48, 48),
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
      //   currentIndex: 1,
      //   onTap: (int index) {
      //     switch (index) {
      //       case 0:
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => HomeScreen()),
      //         );
      //         break;
      //       case 1:
      //         // Do nothing (already on FavoritesScreen)
      //         break;
      //       case 2:
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(builder: (context) => ProfilScreen()),
      //         );
      //         break;
      //     }
      //   },
      // ),
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
