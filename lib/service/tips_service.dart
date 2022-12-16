// import 'dart:convert';
// import 'package:dio/dio.dart';

// import '../models/tips_model.dart';

// class TipsService{
//   var baseUrlApi = "https://ajibtips-57a86-default-rtdb.firebaseio.com/data.json";
//   //   Future<List<RamenModel>> fetchRamens() async {
// //     Response response = await Dio().get(
// //         "http://localhost:3000/data");
// //     List<RamenModel> ramens = (response.data['data'] as List).map((v) => RamenModel.fromJSON(v)).toList();
// //     return ramens;
// //   }
// // static Future<Map<String, dynamic>> getDataRamene() async {
// //   Dio dio = Dio();
// //   var response = await dio
// //       .get('http://localhost:3000/data');
// //   print('status code : ${response.statusCode}');
// //   var dataResponse = response.data;
// //
// //   return dataResponse;
// //   }

//    Future<List<TipsModel>> getDataTips() async {
//      Response response = await Dio().get("$baseUrlApi/data");
//      List<TipsModel> Tips =
//      (response.data as List).map((v) => TipsModel.fromJSON(v)).toList();
//      return Tips;
//   }

// }

