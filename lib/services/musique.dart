import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:animationtest/models/listdata.dart';

final String url = " https://api.deezer.com/search?q=eminem";

Future<ListData> getMusique() async {
  var response = await http.get(Uri.parse(url));

  try {
    if(response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data;
      // return ListData(
      //   titre: data['title'],
      //   artiste: data['artist']['name'],
      //   image: data['album']['cover'],
      //   preview: data['preview'],
      // );
    }
    else{
      throw Exception('Failed to load data:${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load data:$e');
  }
}