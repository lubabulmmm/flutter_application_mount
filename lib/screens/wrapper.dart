import 'package:flutter/material.dart';
import 'package:flutter_application_mount/data/user.dart';
// import 'package:flutter_application_mount/screens/authenticate/profil.dart';
import 'package:flutter_application_mount/screens/authenticate/authenticate.dart';
import 'package:flutter_application_mount/screens/home/homescreen.dart';
// import 'package:flutter_application_mount/screens/home/homescreen.dart';
// import 'package: flutter_application_mount/profil.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserCreate?>(context);
    print(user);

    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
  }
}
