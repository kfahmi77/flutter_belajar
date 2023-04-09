import 'dart:convert';

import 'package:http/http.dart' as http;

import 'http_model.dart';

Future<List<Galleries>> fetchPhotos(
    {required int offset, required int limit}) async {
  final response = await http.get(Uri.parse(
      'https://jsonplaceholder.typicode.com/photos?_start=$offset&_limit=$limit'));
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((item) => Galleries.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load photos');
  }
}
