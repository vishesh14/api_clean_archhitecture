import 'package:api_clean_archhitecture/domain/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class MyProviderHome extends StatefulWidget {
  const MyProviderHome({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomeProviderState();
}


class _MyHomeProviderState extends State<MyProviderHome> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffoold'),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: postModel.loading
            ? Center(
                child: SpinKitThreeBounce(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: index.isEven ? Colors.red : Colors.green));
                  },
                ),
              )
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        postModel.post!.title ?? "",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(postModel.post!.body ?? ""),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
