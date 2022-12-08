import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _Signup();
}

class _Signup extends State<Signup>{
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        // centerTitle: true,
        // backgroundColor: Colors.white,
        // leading: const Icon(
        //   Icons.arrow_back,
        //   color: Colors.black,
        // ),
      ),
      backgroundColor: Colors.black87,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: const <Widget>[
                  Text(
                    "Daftar",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins Bold',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 3),
                  Text("Silahkan daftar untuk membuat akun baru",
                      style: TextStyle(
                        color: lightGrey,
                        fontSize: 17,
                        fontFamily: 'Poppins Light',
                    )),
                ],
              ),
            ),
            SizedBox(height: 25),
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
                labelText: "Email Address",
                hintText: "Email Address",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
            SizedBox(height: 18),
            TextField(
              controller: controllerPassword,
              style: const TextStyle(
                fontFamily: 'Poppins Light',
                fontSize: 16,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Password",
                hintText: "Password",
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                  var username = await Dio().get(
                    'http://localhost:3000/user?username=${controllerUsername.text}'
                  );
                  var password = await Dio().get(
                    'http://localhost:3000/user?password=${controllerPassword.text}'
                  );

                  if (username.data.length > 0){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text("Username Already Exist"),
                    ));
                    controllerUsername.clear();
                    controllerPassword.clear();
                  } else {
                    var response = await Dio().post('http://localhost:3000/user',
                    data : {
                      "username": controllerUsername.text,
                      "password": controllerPassword.text
                    }
                    );

                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login()));
                  }
              },
              child: const Text("Register",
                  style: TextStyle(
                    fontFamily: 'Poppins Bold',
                    fontSize: 18,
                  )),
              style: ElevatedButton.styleFrom(
                  primary: orangeAccent,
                  minimumSize: const Size.fromHeight(55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("",
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: lightGrey,
                    )),
                SizedBox(width: 7),
                Text("",
                    style: TextStyle(
                      fontFamily: 'Poppins Light',
                      fontSize: 16,
                      color: orangeAccent,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
