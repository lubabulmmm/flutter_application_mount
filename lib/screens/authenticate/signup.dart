// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_mount/service/auth.dart';
import 'package:flutter_application_mount/shared/loading.dart';

class RegisterPage extends StatefulWidget {
  final Function togglePage;
  const RegisterPage({super.key, required this.togglePage});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool load = false;

  // AuthService _auth = AuthService();

  String email = '';
  String pass = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return load
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Card(
                elevation: 5.0,
                color: Color.fromARGB(255, 28, 33, 42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Daftar Sekarang',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 23.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          width: 130.5,
                          height: 130.5,
                          child: const Image(
                              image: NetworkImage(
                                  'https://drive.google.com/uc?export=view&id=1hSTar_Qspa8z2UE2F6jGe0zNXubxkTjq')),
                        ),
                        Text(
                          'Daftar dengan email',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: const Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          width: 310,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TextFormField(
                                validator: (String? value) {
                                  if (value != null && value.isEmpty) {
                                    return "E-mail tidak boleh kosong!";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                                cursorColor: Colors.red[800],
                                style: TextStyle(
                                    color: Colors
                                        .white), // Set text color to white
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(15.0),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        borderSide: const BorderSide(
                                            width: 2,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255))),
                                    labelText: 'Masukkan E-mail',
                                    labelStyle: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 250, 250, 250),
                                        fontSize: 15.0)),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              TextFormField(
                                validator: (String? value) {
                                  if (value != null && value.isEmpty) {
                                    return "E-mail tidak boleh kosong!";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (val) {
                                  setState(() => pass = val);
                                },
                                obscureText: true,
                                cursorColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                style: TextStyle(
                                    color: Colors
                                        .white), // Set text color to white
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(15.0),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                          width: 2,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255))),
                                  labelText: 'Masukkan Kata Sandi',
                                  labelStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontSize: 15.0),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                  width: 310,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() => load = true);
                                        dynamic result = await _auth
                                            .registerEAP(email, pass);
                                        if (result == null) {
                                          setState(() {
                                            error =
                                                'Terjadi Kesalahan, Coba Lagi';
                                            load = false;
                                          });
                                        }
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.all(18.0),
                                        elevation: 2.0,
                                        shape: StadiumBorder(),
                                        backgroundColor:
                                            Color.fromARGB(255, 1, 57, 92)),
                                    child: const Text('Daftar Sekarang',
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 250, 250, 250),
                                            fontSize: 15.0)),
                                  )),
                              SizedBox(
                                height: 10.0,
                              ),
                              Container(
                                width: 310,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    widget.togglePage();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(18.0),
                                      elevation: 2.0,
                                      shape: StadiumBorder(),
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 255, 255)),
                                  child: const Text('Sudah Punya Akun? Masuk',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 29, 28, 46),
                                          fontSize: 15.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //   error,
                        //   style: TextStyle(color: Colors.red[800]),
                        // ),
                        // Text(
                        //   '©️Copyright 2023, sMovie.com',
                        //   style: TextStyle(color: Colors.red[800]),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
