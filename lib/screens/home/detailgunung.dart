import 'package:flutter/material.dart';
import 'package:flutter_application_mount/screens/home/gunung.dart';

class DetailScreen extends StatefulWidget {
  final String nama;
  final String lokasi;
  final String pict;
  final String tiket;
  final String jam;
  final String desc;

  const DetailScreen({
    Key? key,
    required this.nama,
    required this.lokasi,
    required this.pict,
    required this.tiket,
    required this.jam,
    required this.desc,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Gunung',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0F1A1A),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.pict),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      widget.nama,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Color.fromARGB(255, 252, 252, 252),
                      ),
                    ),
                    const Spacer(),
                    // MouseRegion(
                    //   cursor: SystemMouseCursors.click,
                    //   child: IconButton(
                    //     icon: Icon(
                    //       widget.gunungs.isFavorite
                    //           ? Icons.favorite
                    //           : Icons.favorite_border_outlined,
                    //       color: widget.gunungs.isFavorite
                    //           ? Colors.red
                    //           : Colors.white,
                    //     ),
                    //     onPressed: () {
                    //       setState(() {
                    //         widget.gunungs.isFavorite =
                    //             !widget.gunungs.isFavorite;
                    //       });
                    //       // Handle button click
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      size: 22,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Disukai oleh ' + widget.nama,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 13,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.location_on_outlined,
                      size: 22,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      widget.lokasi,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                const Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 20,
                  thickness: 2,
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.watch_later_outlined,
                      size: 25,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jam Operasional',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          '24 Jam',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 120.0),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.attach_money_outlined,
                            size: 25,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Harga Tiket',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 18,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                'Rp ..... /orang',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                const Divider(
                  color: Color.fromARGB(255, 255, 255, 255),
                  height: 20,
                  thickness: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 22,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      widget.desc,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 11,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
