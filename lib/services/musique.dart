import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:animationtest/models/listdata.dart';

final String url = "https://api.deezer.com/search?q=eminem";

Future<List<ListData>> getMusique() async {
  var response = await http.get(Uri.parse(url));
  try {
    if (response.statusCode == 200) {
  var data = jsonDecode(response.body);
  List result = data['data'];
  print(result);

  return result.map<ListData>((item) => ListData(
    title: item['title'],
    artist: item['artist']['name'],
    picture: item['album']['cover_medium'],
    preview: item['preview'],
  )).toList();
} else {
  throw Exception('Erreur lors de la récupération des données');
}

  } catch (e) {
    throw Exception('Failed to load data:$e');
  }
}

