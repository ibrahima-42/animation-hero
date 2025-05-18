import 'dart:convert';
import 'package:animationtest/models/track.dart';
import 'package:http/http.dart' as http;
import 'package:animationtest/models/listdata.dart';

final String url = "https://api.deezer.com/search?q=eminem";

Future<List<ListData>> getMusique() async {
  var response = await http.get(Uri.parse(url));
  try {
    if (response.statusCode == 200) {
  var data = jsonDecode(response.body);
  List result = data['data'];


  return result.map<ListData>((item) => ListData(
    title: item['title'],
    artist: item['artist']['name'],
    picture: item['album']['cover_medium'],
    tracklist: item['album']['tracklist'],
    preview: item['preview'],
  )).toList();
} else {
  throw Exception('Erreur lors de la récupération des données');
}

  } catch (e) {
    throw Exception('Failed to load data:$e');
  }
}


Future <List<Track>> fetchTrack(String trackListUrl) async {
  final response = await http.get(Uri.parse(trackListUrl));

  if( response.statusCode == 200) {
    final data = jsonDecode(response.body);

    final tracks = data['data'] as List;

    return tracks.map((json) => Track.fromJson(json)).toList();
  }else {
    throw Exception("Pas de Track trouver, erreur l'or du chargement ");
  }
}

