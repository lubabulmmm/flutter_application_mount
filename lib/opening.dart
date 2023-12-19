import 'package:flutter/material.dart';
import 'package:flutter_application_mount/screens/authenticate/login.dart';
import 'package:flutter_application_mount/screens/authenticate/signup.dart';
// import 'package:flutter_application_mount/screens/authenticate/signup.dart';
// import 'package:flutter_application_mount/screens/authenticate/signup.dart';

class FirstOpening extends StatefulWidget {
  const FirstOpening({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<FirstOpening> {
  @override
  void initState() {
    super.initState();
    // Navigasi ke secondopening dalam 5 detik
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SecondOpening()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 275,
              height: 200,
              margin: const EdgeInsets.all(0),
              child: Center(child: Image.asset('img/logo.png')),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman SecondOpening
class SecondOpening extends StatefulWidget {
  @override
  State<SecondOpening> createState() => _SecondOpeningState();
}

class _SecondOpeningState extends State<SecondOpening> {
  bool showPage = true;

  void togglePage() {
    setState(() => showPage = !showPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('img/opening-background.png'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 318,
            margin: EdgeInsets.only(top: 225, right: 20, left: 20),
            child: SizedBox(
              child: Text(
                'Jelajahi\nKeindahan Alam Indonesia',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Container(
            width: 318,
            margin: EdgeInsets.all(20),
            child: SizedBox(
              child: Text(
                'Jika Anda suka mendaki gunung, ini adalah tempat Anda! Di sini Anda dapat mendaki gunung tanpa repot dan menkmatinya',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          // Button ke halaman login
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SignInPage1(
                          togglePage: togglePage,
                        )),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 20),
              backgroundColor: Color.fromRGBO(47, 76, 68, 1.000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: const Text(
              'Masuk',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 13),
            ),
          ),
          // SizedBox(
          //   height: 20.0,
          // ),
          //Button ke halaman sign up
          SizedBox(
            height: 20.0,
          ),
// Button ke halaman sign up
          ElevatedButton(
            onPressed: () {
              // Add navigation to your registration page here
              // For example:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterPage(
                          togglePage: togglePage,
                        )),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 20),
              backgroundColor: Color.fromRGBO(47, 76, 68, 1.000),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            child: const Text(
              'Daftar',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 13),
            ),
          ),
        ],
      ),
    ));
  }
}
