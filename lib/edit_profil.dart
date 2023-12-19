import 'package:flutter/material.dart';

class EditProfil extends StatefulWidget {
  const EditProfil({super.key});

  @override
  State<EditProfil> createState() => _EditProfilState();
}

class _EditProfilState extends State<EditProfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profil',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://drive.google.com/uc?export=view&id=1vsnOyNPyz1eDFym0xFdvL7Nicns89LYr'),
                  ),
                  // Positioned(
                  //   bottom: -10,
                  //   left: 80,
                  //   child: IconButton(
                  //     onPressed: selectImage,
                  //     icon: const Icon(Icons.add_a_photo),
                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                // controller: nameController,
                style: TextStyle(
                  color: Color.fromARGB(255, 134, 134, 134),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  labelText: 'Masukkan Username',
                  focusColor: Color.fromARGB(255, 192, 192, 192),
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 255, 255, 255))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                // controller: nameController,
                style: TextStyle(
                  color: Color.fromARGB(255, 134, 134, 134),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  labelText: 'Masukkan Email',
                  focusColor: Color.fromARGB(255, 192, 192, 192),
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 255, 255, 255))),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                // controller: nameController,
                style: TextStyle(
                  color: Color.fromARGB(255, 134, 134, 134),
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  labelText: 'Masukkan Password',
                  focusColor: Color.fromARGB(255, 192, 192, 192),
                  labelStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromARGB(255, 255, 255, 255))),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 25,
              ),
              // ElevatedButton(
              //   onPressed:
              //     SaveProfil,
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Color.fromRGBO(47, 76, 68, 1.000),
              //   ),
              //   child: const Text('Simpan', style: TextStyle(
              //     color: Colors.white
              //   ), ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
