import 'dart:convert';
import 'dart:html';

import '../domain/albums.dart';
import 'package:http/http.dart' as http;

Future<Album> getAlbum() async{

  var response = await http.get(Uri.parse("uri"));
  if(response.statusCode == 200)
    {
      return Album.fromMap(jsonDecode(response.body));
    }
  else {
    throw Exception("Error");

  }
}