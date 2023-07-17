import 'package:api_clean_archhitecture/presentation/my_provider_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/data.dart';

void main() {
  runApp(const MyMainApp());
}

class MyMainApp extends StatelessWidget{
  const MyMainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create :(context) => DataClass(),
      child: const MaterialApp(
        title: "Provider",
        home: MyProviderHome(),
      ),
    );
  }


}


