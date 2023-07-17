import 'package:api_clean_archhitecture/data/service.dart';
import 'package:api_clean_archhitecture/domain/data_model.dart';
import 'package:flutter/cupertino.dart';

class DataClass extends ChangeNotifier{

  DataModel? post;
  bool loading = false;

  getPostData() async
  {
  loading = true;
  post = (await getSinglePostJson())!;
  loading = false;
  notifyListeners();
  }
}