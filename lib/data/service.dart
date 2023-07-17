import 'dart:convert';
import 'dart:io';
import 'dart:math';

import '../domain/data_model.dart';
import 'package:http/http.dart' as http;

Future<DataModel?>? getSinglePostJson() async{

  DataModel? result;
  try{

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/2'),
      headers: {
        HttpHeaders.contentTypeHeader : "application/json"
      }
      );
    if(response.statusCode == 200)
      {
        final item = jsonDecode(response.body);
        result = DataModel.fromJson(item);
      }
    else {
     print("Error");
    }

  }catch (e)
  {
    log(e.toString() as num);
  }
  return result;
}