import 'package:contoh_navigasi_flutter/models/tips_model.dart';
import 'package:contoh_navigasi_flutter/viewmodel/tips_service.dart';
import 'package:flutter/material.dart';

class Detailfilm extends StatelessWidget {
  final TipsModel film;

  const Detailfilm({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text(film.name),
        ),
        backgroundColor: Colors.black87,
        body: FutureBuilder<List<TipsModel>>(
            future: TipsService.fetchTipsPC(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 8),
                                        child: Text(film.name,
                                            style: TextStyle(
                                                color: Colors.grey[100])),
                                      ),
                                      Text(
                                        film.sekilas,
                                        style:
                                            TextStyle(color: Colors.grey[100]),
                                      ),
                                      SizedBox(height: 20),
                                      Container(
                                        height: 300,
                                        width: 400,
                                        child: Image.network(film.img_url),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            film.deskripsi,
                            style: TextStyle(color: Colors.grey[100]),
                            softWrap: true,
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  );

                  // ListView(
                  //   children: <Widget>[
                  //     Image.network(
                  //       film.gambar,
                  //       width: 600,
                  //       fit: BoxFit.cover,
                  //     ),
                  //     bagianJudul,
                  //     bagianDeskripsi,
                  //   ],
                  // ),
                }
              }
            }));
  }
}
