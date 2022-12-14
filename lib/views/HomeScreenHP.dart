import 'package:contoh_navigasi_flutter/models/tips_model.dart';
import 'package:contoh_navigasi_flutter/viewmodel/tips_service.dart';
import 'package:contoh_navigasi_flutter/views/landing.dart';
import 'package:flutter/material.dart';
import 'package:contoh_navigasi_flutter/views/Detail.dart';

import 'HomeScreen.dart';

class HomeScreenHP extends StatelessWidget {
  // final List<Tips> tips = [
  //   Tips(
  //       'Kinemaster',
  //       'Aplikasi yang di khususkan untuk membuat Video',
  //       'Standar industri untuk grafik gerak dan efek visual, Adobe After Effects digunakan oleh perancang gerak, perancang grafis, dan editor video untuk membuat visual canggih untuk film, TV, media sosial, web, dan banyak lagi.',
  //       'https://upload.wikimedia.org/wikipedia/commons/2/29/Appicon_KineMaster.png'),
  //   Tips(
  //       'Capcut',
  //       'Aplikasi yang di khususkan untuk membuat Video Instan',
  //       'Adobe Premiere Pro adalah aplikasi pengeditan video tingkat lanjut yang memungkinkan Anda membuat film, siaran, dan konten sosial. Susun video dan tambahkan judul dengan berbagai alat kreatif dan AI.',
  //       'https://p16-sign-sg.tiktokcdn.com/aweme/720x720/tos-alisg-avt-0068/1af2f2fbb384f9105867c992dc6becf9.jpeg?x-expires=1670659200&x-signature=T8mULd%2ByDPU3YzVWVmzxpxH7Q5s%3D'),
  //   Tips(
  //       'VN',
  //       'Aplikasi yang di khususkan untuk membuat Video Cepat',
  //       'Proses dan kelola media Anda dengan Adobe Media Encoder, aplikasi yang memungkinkan Anda menyerap, mentranskode, membuat proksi, dan mengeluarkan ke hampir semua format yang dapat Anda bayangkan.',
  //       'https://play-lh.googleusercontent.com/0mvy747JRrqlziGtpvii5zKcMgL0AYRjXNRMlBkUbYadBabC1Dg466LsLKFION1vTg=w240-h480-rw'),
  //   Tips(
  //       'Node',
  //       'Aplikasi yang di gunakan untuk editing VFX',
  //       'Abadikan, rancang, dan padukan suara dengan Adobe Audition, workstation audio digital terbaik di industri. Rekam, edit, dan bersihkan konten audio dengan mudah dengan tampilan multitrack, bentuk gelombang, dan frekuensi spektral.',
  //       'https://image.winudf.com/v2/image1/Y29tLnNoYWxsd2F5c3R1ZGlvLm5vZGV2aWRlb19pY29uXzE2MjYyNzc3MDRfMDE0/icon.png?w=140&fakeurl=1'),
  //   Tips(
  //       'Pixellab',
  //       'Aplikasi yang di khususkan untuk editing foto atau gambar',
  //       'Adobe Photoshop adalah aplikasi pengeditan gambar tingkat lanjut yang memungkinkan Anda mengubah foto, grafik, dan ilustrasi. Edit dan buat dengan lapisan, kuas, alat AI, dan lainnya.',
  //       'https://play-lh.googleusercontent.com/TqRTx4hbmOEeHz2PrH0lcWNNt83S5S22Qm06Epw5Ja-_0rPYgNYNQkAQRLaBKr2l4ew'),
  //   Tips(
  //       'Picsart',
  //       'Aplikasi yang di gunakan untuk membuat desain',
  //       'Adobe Illustrator adalah aplikasi desain grafis canggih yang memungkinkan Anda membuat ilustrasi, logo, dan lainnya. Gunakan alat yang tepat untuk membuat karya seni vektor yang dapat diskalakan ke berbagai ukuran.',
  //       'https://cdnblog.picsart.com/2021/07/icon-square-780x780.jpg'),
  //   ];
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
          title: Text('Ajib Tips HP'),
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
                  onTap: () => print('Sek2 gurung2 wkwk')),
              ListTile(
                leading: Icon(Icons.school),
                title: const Text('Software Sindows/Mac'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
              ),
              ListTile(
                  leading: Icon(Icons.school),
                  title: const Text('Software APK/Android'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => HomeScreenHP()));
                  }),
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
        body: FutureBuilder<List<TipsModel>>(
            future: TipsService().getDataTipsHp(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return Container(
                      color: Colors.black,
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detailfilm(
                                              film: snapshot.data![index],
                                            )));
                              },
                              child: Card(
                                color: Colors.blueGrey,
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.network(
                                          '${snapshot.data![index].img_url}',
                                          width:100,
                                          ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0),
                                            child: Text(
                                              snapshot.data![index].name,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Text(
                                            snapshot.data![index].sekilas,
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }));
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
            }));
  }
}
