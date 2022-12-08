import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:contoh_navigasi_flutter/views/landing.dart';
import 'package:flutter/material.dart';
import 'package:contoh_navigasi_flutter/models/film.dart';
import 'package:contoh_navigasi_flutter/views/Detailfilm.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


class HomeScreen extends StatelessWidget {
  final List<Film> film = [
    Film(
        'Iron man 2008',
        'tanggal rilis 2 Mei 2008',
        'Iron Man 2008 menceritakan kisah Tony Stark , seorang industrialis miliarder dan penemu jenius yang diculik dan dipaksa untuk membuat senjata yang menghancurkan. Sebaliknya, menggunakan kecerdasan dan kecerdikannya, Tony membangun baju zirah berteknologi tinggi dan lolos dari penangkaran. Ketika dia mengungkap plot jahat dengan implikasi global, dia mengenakan baju besinya yang kuat dan bersumpah untuk melindungi dunia sebagai Iron Man..',
        'https://terrigen-cdn-dev.marvel.com/content/prod/1x/ironman_lob_crd_01_3.jpg'),
    Film(
        'The incredible hulk',
        'tanggal rilis 13 Juni 2008',
        'Di awal yang baru ini, ilmuwan Bruce Banner dengan putus asa mencari obat untuk radiasi gamma yang meracuni sel-selnya dan melepaskan kekuatan kemarahan yang tak terkendali dalam dirinya: The Hulk. Hidup dalam bayang-bayang - terputus dari kehidupan yang dia kenal dan wanita yang dia cintai, Betty Ross - Banner berjuang untuk menghindari pengejaran obsesif musuh bebuyutannya, Jenderal Thunderbolt Ross dan mesin militer yang berusaha menangkapnya dan secara brutal mengeksploitasi musuhnya. kekuasaan. Ketika ketiganya bergulat dengan rahasia yang mengarah pada penciptaan Hulk, mereka dihadapkan dengan musuh baru yang mengerikan yang dikenal sebagai Abomination, yang kekuatan destruktifnya bahkan melebihi milik Hulk. Seorang ilmuwan harus membuat pilihan terakhir yang menyakitkan: menerima kehidupan yang damai sebagai Bruce Banner atau menemukan kepahlawanan dalam makhluk yang dia pegang di dalam - The Incredible Hulk..',
        'https://terrigen-cdn-dev.marvel.com/content/prod/1x/theincrediblehulk_lob_crd_01_2.jpg'),
    Film(
        'Iron Man 2',
        'tanggal rilis 7 mei 2010',
        'Dengan dunia yang sekarang menyadari bahwa dia adalah Iron Man, penemu miliarder Tony Stark menghadapi tekanan dari semua pihak untuk berbagi teknologinya dengan militer. Dia enggan membocorkan rahasia baju lapis bajanya, takut informasi itu akan jatuh ke tangan yang salah. Dengan Pepper Potts dan "Rhodey" Rhodes di sisinya, Tony harus membentuk aliansi baru dan menghadapi musuh baru yang kuat.',
        'https://terrigen-cdn-dev.marvel.com/content/prod/1x/ironman2_lob_crd_01_3.jpg'),
    Film(
        'Thor',
        'tanggal rilis 6 mei 2011',
        'Sebagai putra Odin, raja para dewa Norse, Thor akan segera mewarisi tahta Asgard dari ayahnya yang sudah lanjut usia. Namun, pada hari dia akan dinobatkan, Thor bereaksi dengan brutal ketika musuh para dewa, Frost Giants, memasuki istana dengan melanggar perjanjian mereka. Sebagai hukuman, Odin mengusir Thor ke Bumi. Sementara Loki, saudara laki-laki Thor, merencanakan kejahatan di Asgard, Thor, yang sekarang kehilangan kekuatannya, menghadapi ancaman terbesarnya.',
        'https://terrigen-cdn-dev.marvel.com/content/prod/1x/thor_lob_crd_01.jpg'),
    Film(
        'Captain America: The First Avenger',
        'tanggal rilis 22 juni 2011',
        '"Captain America: The First Avenger" Marvel berfokus pada hari-hari awal Alam Semesta Marvel ketika Steve Rogers secara sukarela berpartisipasi dalam program eksperimental yang mengubahnya menjadi Prajurit Super yang dikenal sebagai Captain America.',
        'https://terrigen-cdn-dev.marvel.com/content/prod/1x/captainamerica_lob_crd_01.jpg'),
    Film(
        'The Avenger',
        'tanggal rilis 4 mei 2012',
        'Marvel Studios mempersembahkan bersama Paramount Pictures "Marvels The Avengers" -- tim pahlawan super seumur hidup, menampilkan pahlawan super ikonik Marvel Iron Man, Incredible Hulk, Thor, Captain America, Hawkeye, dan Black Widow. Ketika musuh tak terduga muncul yang mengancam keselamatan dan keamanan global, Nick Fury, Direktur badan penjaga perdamaian internasional yang dikenal sebagai S.H.I.E.L.D., mendapati dirinya membutuhkan tim untuk menarik dunia kembali dari ambang bencana. Mencakup dunia, upaya perekrutan berani dimulai.',
        'https://terrigen-cdn-dev.marvel.com/content/prod/1x/theavengers_lob_crd_03.jpg'),
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
              title: const Text('Teknik Informatika'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
                leading: Icon(Icons.school),
                title: const Text('Teknik Arsitektur'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new MyHomePage()));
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
            itemCount: film.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Detailfilm(
                            film: film[index],
                          )));
                },
                child: Card(
                  color: Colors.blueGrey,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          '${film[index].gambar}',
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
                                '${film[index].nama}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text('${film[index].tanggal}'),
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