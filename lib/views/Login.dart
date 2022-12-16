import 'package:contoh_navigasi_flutter/views/HomeScreenHP.dart';

import 'HomeScreen.dart';
import 'landing.dart';
import 'signup.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  // Function setTheme;
  // Login({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ThemeData themeData = ThemeData.light();

  void setTheme(bool isDarkmode) {
    setState(() {
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerUsername = TextEditingController();
    TextEditingController controllerPassword = TextEditingController();

//Variable
    // var email = "ajib";
    // var pwd = "ajib";

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 116, 116, 116),
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: const <Widget>[
                  Text(
                    "Selamat datang",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins Bold',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text("Silahkan masuk menggunakan akun anda",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Poppins Light',
                      )),
                ],
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: controllerUsername,
              style: const TextStyle(
                fontFamily: 'Poppins Light',
                fontSize: 16,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Email Address ",
                hintText: "Email Address",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins Light',
                  fontSize: 16,
                  color: Colors.white,
                ),
                labelStyle: const TextStyle(
                  color: Colors.white,
                )
              ),
            ),
            const SizedBox(height: 18),
            TextField(
              controller: controllerPassword,
              style: const TextStyle(
                fontFamily: 'Poppins Light',
                fontSize: 16,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Password",
                hintText: "Password",
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins Light',
                  fontSize: 16,
                  color: Colors.white,
                ),
                labelStyle: const TextStyle(
                  color: Colors.white,
                )
              ),
            ),
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "lupa sandi?",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontFamily: 'Poppins Light',
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () async {
                var username = await Dio().get(
                    'http://192.168.31.204:3000/user?username=${controllerUsername.text}');
                var password = await Dio().get(
                    'http://192.168.31.204:3000/user?password=${controllerPassword.text}');
                if (username.data.length > 0) {
                  if (password.data.length > 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Password Salah"),
                    ));
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Email Salah")));
                }
              },
              child: const Text("SIGN IN",
                  style: TextStyle(
                    fontFamily: 'Poppins Bold',
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  minimumSize: const Size.fromHeight(55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Belum memiliki akun?",
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: Colors.blue,
                    )),
                // SizedBox(width: 7),
                // Text("Sign up",
                //     style: TextStyle(
                //       fontFamily: 'Poppins Light',
                //       fontSize: 16,
                //       color: Colors.blue,
                //     )
                //   ),
              ],
            ),
            new InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    new MaterialPageRoute(builder: (BuildContext context) {
                  return new Signup();
                }));
              },
              child: new Padding(
                padding: new EdgeInsets.all(10.0),
                child: new Text("Daftar",
                style: const TextStyle(color: Colors.blue,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
