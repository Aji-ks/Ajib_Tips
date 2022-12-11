import 'package:contoh_navigasi_flutter/views/landing.dart';
import 'package:flutter/material.dart';
import 'package:contoh_navigasi_flutter/models/tips.dart';
import 'package:contoh_navigasi_flutter/views/Detailtips.dart';

import '../models/tips_model.dart';
import '../service/tips_service.dart';
import 'HomeScreenHP.dart';
import 'constant.dart';

class HomeScreen extends StatelessWidget {
  final List<Tips> tipspc = [
    Tips(
        'Adobe After effect',
        'Aplikasi yang di khususkan untuk membuat VFX',
        'Standar industri untuk grafik gerak dan efek visual, Adobe After Effects digunakan oleh perancang gerak, perancang grafis, dan editor video untuk membuat visual canggih untuk film, TV, media sosial, web, dan banyak lagi.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Adobe_After_Effects_CC_icon.svg/512px-Adobe_After_Effects_CC_icon.svg.png?20210519030120'),
    Tips(
        'Adobe Premiere',
        'Aplikasi yang di gunakan untuk compositing video',
        'Adobe Premiere Pro adalah aplikasi pengeditan video tingkat lanjut yang memungkinkan Anda membuat film, siaran, dan konten sosial. Susun video dan tambahkan judul dengan berbagai alat kreatif dan AI.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Adobe_Premiere_Pro_CC_icon.svg/2101px-Adobe_Premiere_Pro_CC_icon.svg.png'),
    Tips(
        'Adobe Media Encoder',
        'Aplikasi yang dapat melakukan antrian render dalam satu tekan',
        'Proses dan kelola media Anda dengan Adobe Media Encoder, aplikasi yang memungkinkan Anda menyerap, mentranskode, membuat proksi, dan mengeluarkan ke hampir semua format yang dapat Anda bayangkan.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Adobe_Media_Encoder_Icon.svg/1200px-Adobe_Media_Encoder_Icon.svg.png'),
    Tips(
        'Adobe Audition',
        'Aplikasi yang di gunakan untuk editing audio atau suara',
        'Abadikan, rancang, dan padukan suara dengan Adobe Audition, workstation audio digital terbaik di industri. Rekam, edit, dan bersihkan konten audio dengan mudah dengan tampilan multitrack, bentuk gelombang, dan frekuensi spektral.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Adobe_Audition_CC_icon_%282020%29.svg/1200px-Adobe_Audition_CC_icon_%282020%29.svg.png'),
    Tips(
        'Adobe Photoshop',
        'Aplikasi yang di khususkan untuk editing foto atau gambar',
        'Adobe Photoshop adalah aplikasi pengeditan gambar tingkat lanjut yang memungkinkan Anda mengubah foto, grafik, dan ilustrasi. Edit dan buat dengan lapisan, kuas, alat AI, dan lainnya.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Adobe_Photoshop_CC_icon.svg/1200px-Adobe_Photoshop_CC_icon.svg.png'),
    Tips(
        'Adobe Illustrator',
        'Aplikasi yang di gunakan untuk membuat desain',
        'Adobe Illustrator adalah aplikasi desain grafis canggih yang memungkinkan Anda membuat ilustrasi, logo, dan lainnya. Gunakan alat yang tepat untuk membuat karya seni vektor yang dapat diskalakan ke berbagai ukuran.',
        'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Adobe_Illustrator_CC_icon.svg/1200px-Adobe_Illustrator_CC_icon.svg.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text('Ajib Tips'),
      ),
      backgroundColor: Colors.black87,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
              child: Text('Ajib Film'),
            ),
            ListTile(
                leading: Icon(Icons.home),
                title: const Text('HOME'),
                onTap: () => print('Tap Trash menu')),

            ListTile(
              leading: Icon(Icons.school),
              title: const Text('Software Sindows/Mac'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen(),
                    ));
              },
            ),
            ListTile(
                leading: Icon(Icons.school),
                title: const Text('Software APK/Android'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new HomeScreenHP()));
                }
            ),
            new Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              trailing: new Icon(Icons.cancel),
              title: const Text('LOGOUT'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),

    body: FutureBuilder<List<dynamic>>(
      future: RameneService.getDataRamenFake(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: Text(
                  'Silahkan menunggu')); // apabila snapshot.data maka muncul null karena sedang proses menampilkan data
        } else {
          if (snapshot.hasError) {
            return Center(
                child: Text(
                  'Error: ${snapshot.error}'), // apabila snapshot.data maka muncul Error: null karena gagal mengambil data
                    // 'Error')
            );
          } else {
            print(snapshot.data!.length,);
            // print(snapshot.data![0]['name']);
            return Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(children: <Widget>[
                const SizedBox(height: 10),
                TextField(
                  controller: null,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.grey))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: FutureBuilder<List<dynamic>>(
                    future: RameneService.getDataRamenFake(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        if (snapshot.hasError) {
                          print(snapshot.data![0]);
                          return Text(snapshot.error.toString());
                        } else {
                          print(snapshot.data![0]['name']);
                          return GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 10,
                                childAspectRatio: 0.75,
                              ),
                              itemCount: snapshot.data!.length,
                              padding: EdgeInsets.all(10),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        // height: 170,
                                        // width: 160,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(16),
                                            image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  "${snapshot.data![index]['img_url']}"),
                                            )),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "${snapshot.data![index]['name']}",
                                      style: TextStyle(
                                        color: lightGrey,
                                        fontFamily: 'Poppins Light',
                                      ),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "${snapshot.data![index]['sekilas']}",
                                      style: TextStyle(
                                        color: darkGrey,
                                        fontFamily: 'Poppins Regular',
                                      ),
                                    ),
                                  ],

                                );
                              });
                        }
                      }
                    },
                  ),
                ),
              ]),
            );
          }
        }
      },
    ),
      );
  }
}