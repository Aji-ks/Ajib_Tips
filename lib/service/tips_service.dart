import 'dart:convert';
import 'package:dio/dio.dart';

import '../models/tips_model.dart';

class RameneService{
//   Future<List<RamenModel>> fetchRamens() async {
//     Response response = await Dio().get(
//         "http://localhost:3000/data");
//     List<RamenModel> ramens = (response.data['data'] as List).map((v) => RamenModel.fromJSON(v)).toList();
//     return ramens;
//   }
// static Future<Map<String, dynamic>> getDataRamene() async {
//   Dio dio = Dio();
//   var response = await dio
//       .get('http://localhost:3000/data');
//   print('status code : ${response.statusCode}');
//   var dataResponse = response.data;
//
//   return dataResponse;
//   }

  static Future<List<dynamic>> getDataRamenFake() async {
    Dio dio = Dio();
    var response = await dio.get('http://localhost:3000/data');
    print('status code : ${response.statusCode}');
    var dataResponse = response.data;
    return dataResponse;
  }
}

