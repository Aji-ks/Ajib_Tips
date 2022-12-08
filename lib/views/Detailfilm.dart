import 'package:flutter/material.dart';
import 'package:contoh_navigasi_flutter/models/film.dart';

  class Detailfilm extends StatelessWidget {
  final Film film;

  const Detailfilm({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bagianJudul = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(film.nama,
                      style: TextStyle(color: Colors.grey[100])),
                  ),
                  Text(
                    film.tanggal,
                    style: TextStyle(color: Colors.grey[100]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Widget bagianDeskripsi = Container(
      padding: EdgeInsets.all(16),
      child: Text(
        film.deskripsi,
        style: TextStyle(color: Colors.grey[100]),
        softWrap: true,
        textAlign: TextAlign.justify,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(film.nama),
      ),
      backgroundColor: Colors.black87,
      body: ListView(
        children: <Widget>[
          Image.network(
            film.gambar,
            width: 600,
            fit: BoxFit.cover,
          ),
          bagianJudul,
          bagianDeskripsi,
        ],
      ),
    );
  }
}
