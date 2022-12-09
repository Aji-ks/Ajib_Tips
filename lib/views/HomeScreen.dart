import 'package:contoh_navigasi_flutter/views/landing.dart';
import 'package:flutter/material.dart';
import 'package:contoh_navigasi_flutter/models/film.dart';
import 'package:contoh_navigasi_flutter/views/Detailfilm.dart';

import 'HomeScreenHP.dart';

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
    // return ZoomDrawer(
    //   controller: ZoomDrawerController,
    //   style: DrawerStyle.defaultStyle,
    //   menuScreen: MyHomePage(),
    //   mainScreen: MyHomePage(),
    //   borderRadius: 24.0,
    //   showShadow: true,
    //   angle: -12.0,
    //   drawerShadowsBackgroundColor: Colors.grey,
    //   slideWidth: MediaQuery.of(context).size.width*.65,
    //   openCurve: Curves.fastOutSlowIn,
    //   closeCurve: Curves.bounceIn,
    // );
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
      //   backgroundColor: Colors.black87,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   icons: iconList,
      //   activeIndex: _bottomNavIndex,
      //   gapLocation: GapLocation.center,
      //   notchSmoothness: NotchSmoothness.verySmoothEdge,
      //   leftCornerRadius: 32,
      //   rightCornerRadius: 32,
      //   onTap: (index) => setState(() => _bottomNavIndex = index),
      //   //other params
      // ),
    // );
    body: Container(
        child: ListView.builder(
            itemCount: tipspc.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detailfilm(
                            film: tipspc[index],
                          )));
                },
                child: Card(
                  color: Colors.blueGrey,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          '${tipspc[index].gambar}',
                          width: 100,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '${tipspc[index].nama}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text('${tipspc[index].sekilas}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      )
      );
        // bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //       backgroundColor: Colors.black12,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.business),
        //       label: 'Business',
        //       backgroundColor: Colors.green,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.school),
        //       label: 'School',
        //       backgroundColor: Colors.purple,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.settings),
        //       label: 'Settings',
        //       backgroundColor: Colors.pink,
        //     ),
        //   ],
        // ),
  }
}