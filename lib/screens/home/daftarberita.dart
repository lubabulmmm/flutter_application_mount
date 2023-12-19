import 'package:flutter/material.dart';
import 'package:flutter_application_mount/screens/home/berita.dart';
import 'package:flutter_application_mount/screens/home/detailberita.dart';

class DaftarBerita extends StatefulWidget {
  @override
  _DaftarBeritaState createState() => _DaftarBeritaState();
}

class _DaftarBeritaState extends State<DaftarBerita> {
  bool isSettingsSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Daftar berita')),
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
        child: ListView.builder(
          itemCount: dataBerita.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreenBerita(
                      beritaa: dataBerita[index],
                    ),
                  ),
                );
              },
              child: Card(
                color: Color(0xFF0F1A1A),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            dataBerita[index].image,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataBerita[index].judul,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5.0),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color:
                                      Colors.grey, // Set the icon color to gray
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  dataBerita[index].lokasi,
                                  style: TextStyle(
                                    color: Colors
                                        .grey, // Set the text color to gray
                                    fontFamily: 'Poppins', // Use Poppins font
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
        ),
      ),
    );
  }
}
