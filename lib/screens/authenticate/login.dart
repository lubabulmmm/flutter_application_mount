import 'package:flutter/material.dart';
// import 'package:flutter_application_mount/data/homescreen.dart';
import 'package:flutter_application_mount/service/auth.dart';
// import 'package:flutter_application_mount/authenticate/authenticate.dart';

// import 'package: flutter_application_mount/shared/loading.dart';
class SignInPage1 extends StatefulWidget {
  final Function togglePage;
  const SignInPage1({super.key, required this.togglePage});

  @override
  State<SignInPage1> createState() => _SignInPage1State();
}

class _SignInPage1State extends State<SignInPage1> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  // final AuthService _auth = AuthService();
  bool load = false;
  String email = '';
  String pass = '';
  String error = '';

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // return load ? Loading() : Scaffold(
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   backgroundColor: Colors.red[800],
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: Text('Masuk'),
      backgroundColor: Colors.black,
      // ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Card(
            elevation: 8,
            color: Color.fromARGB(255, 28, 33, 42),
            child: Container(
              padding: const EdgeInsets.all(37.0),
              constraints: const BoxConstraints(maxWidth: 375),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://drive.google.com/uc?export=view&id=1hSTar_Qspa8z2UE2F6jGe0zNXubxkTjq',
                      width: 100,
                      height: 100,
                    ),
                    _gap(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Selamat Datang Di Gunung!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Masukkan Email dan Password Anda.",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        // add email validation
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }

                        return null;
                      },
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        prefixIcon:
                            Icon(Icons.email_outlined, color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    _gap(),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }

                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() => pass = val);
                      },
                      obscureText: !_isPasswordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock_outline_rounded,
                            color: Colors.white),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    _gap(),
                    CheckboxListTile(
                      value: _rememberMe,
                      onChanged: (value) {
                        if (value == null) return;
                        setState(() {
                          _rememberMe = value;
                        });
                      },
                      title: const Text(
                        'Remember me',
                        style: TextStyle(color: Colors.white),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      contentPadding: const EdgeInsets.all(0),
                      activeColor: Colors.white,
                      checkColor: Colors.black,
                    ),
                    _gap(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // onPressed: () async {
                        //   if (_formKey.currentState!.validate()) {
                        //     setState(() => load = true);
                        //     dynamic result = await _auth.signInEAP(email, pass);
                        //     if (result == null) {
                        //       setState(() {
                        //         error =
                        //             'Terjadi kesalahan di e-mail atau kata sandi';
                        //         load = false;
                        //       });
                        //     }
                        //   }
                        // },
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => load = true);
                            dynamic result = await _auth.signInEAP(email, pass);
                            setState(
                                () => load = false); // Set load back to false
                            if (result == null) {
                              setState(() {
                                error =
                                    'Terjadi kesalahan di e-mail atau kata sandi';
                              });
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
