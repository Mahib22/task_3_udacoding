import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_3/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nUsername, nPassword;

  final _formKey = GlobalKey<FormState>();

  bool _isHidePassword = true;

  void _togglePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150),
            Text(
              'Login',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Masukkan Username';
                        }
                        return null;
                      },
                      controller: myUsernameController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Masukkan Password';
                        }
                        return null;
                      },
                      controller: myPasswordController,
                      obscureText: _isHidePassword,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            _togglePassword();
                          },
                          child: Icon(
                            _isHidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color:
                                _isHidePassword ? Colors.black : Colors.black,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      onPressed: () {
                        nUsername = myUsernameController.text;
                        nPassword = myPasswordController.text;

                        if (_formKey.currentState.validate()) {
                          if (nUsername != 'udacodingid') {
                            return Fluttertoast.showToast(
                              msg: "Username Anda Salah",
                              fontSize: 16,
                            );
                          } else if (nPassword.length < 6) {
                            Fluttertoast.showToast(
                              msg: "Password Tidak Boleh Kurang Dari 6 Digit",
                              fontSize: 16,
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
