import 'dart:convert';

import 'package:api_clean_archhitecture/data/album_base_api_client.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import '../domain/albums.dart';

class AlbumApiClient extends AlbumBaseApiClient{

  @override
  String get clientApiUrl => 'albums/2';

  Dio  dio = Dio();

  Future<Album> fetchAlbum() async{

    final response = await http.get(Uri.parse('$baseApiAddress$clientApiUrl'));
    if(response.statusCode == 200)
      {
        return Album.fromMap(jsonDecode(response.body));
      }
    else{
      throw Exception('Response body failed');
    }

  }


}