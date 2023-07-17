import 'package:api_clean_archhitecture/data/album_api_client.dart';
import 'package:flutter/material.dart';

import '../domain/albums.dart';

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'MyApp',
      home: MyHomeApp(title: 'My Home Page',),
    );
  }

}

class MyHomeApp  extends StatefulWidget{
  const MyHomeApp({Key? key, required this.title}) : super(key: key);

 final String title;

  @override
  State<StatefulWidget> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp>
{
  late Future<Album> futureAlbum;
  AlbumApiClient albumApiClient = AlbumApiClient();

  @override
  void initState() {
    futureAlbum = albumApiClient.fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar:  AppBar(
       title: const Text('Albums')
      ),
      body: Center(
        child:  FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot){
            if(snapshot.hasData)
              {
                return Text('${snapshot.data?.title}');
              }
            else if(snapshot.hasError)
              {
                return Text('${snapshot.error}');
              }
            else if(snapshot.connectionState == ConnectionState.done)
              {
                return Text('${snapshot.connectionState}');
              }
            else if(snapshot.connectionState == ConnectionState.active)
            {
              return Text('${snapshot.connectionState}');
            }
            else if(snapshot.connectionState == ConnectionState.none)
            {
              return Text('${snapshot.connectionState}');
            }
            else if(snapshot.connectionState == ConnectionState.waiting)
            {
              return Text('${snapshot.connectionState}');
            }
            return const CircularProgressIndicator();
          }
        ),
      ),
    );
  }


}