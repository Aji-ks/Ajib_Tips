import 'package:contoh_navigasi_flutter/views/HomeScreen.dart';
import 'Login.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.black12,
      ),
      backgroundColor: Colors.black87,
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Text("Selamat datang ",
              style: TextStyle(
                color: Colors.grey[100],
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontStyle: FontStyle.italic,
                fontFamily: 'poppins',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            child: Text("di Ajib Tips",
              style: TextStyle(
                color: Colors.grey[100],
                fontWeight: FontWeight.bold,
                fontSize: 32,
                fontStyle: FontStyle.italic,
                fontFamily: 'poppins',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 140),
            child: Image.asset('assets/logo.png'),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text("Kami harap anda menikmati aplikasi kami",
              style: TextStyle(
                color: Colors.grey[100],
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontFamily: 'poppins',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: ConstrainedBox(constraints: const BoxConstraints(minWidth: double.infinity),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Login();
                  }));
                },
                child:
                const Text("Masuk"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
