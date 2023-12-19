import 'package:flutter/material.dart';
import 'package:flutter_application_mount/screens/authenticate/login.dart';
import 'package:flutter_application_mount/screens/authenticate/signup.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showPage = true;
  void togglePage() {
    setState(() => showPage = !showPage);
  }

  @override
  Widget build(BuildContext context) {
    if (showPage) {
      return RegisterPage(togglePage: togglePage);
    } else {
      return SignInPage1(togglePage: togglePage);
    }
  }
}
