import 'package:flutter/material.dart';
import 'package:gg_interview_task/Models/data.dart';
import 'package:gg_interview_task/Provider/data_provider.dart';
import 'package:gg_interview_task/Services/data_service.dart';
import 'package:http/http.dart';

class DataProvider extends ChangeNotifier {
  bool _loading = false;
  List<Datum> _data = [];
  String? _error;
  bool get loading => _loading;
  List<Datum> get data => _data;

  DataProvider() {
    getdata();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setDataList(List<Datum> data) {
    _data = data;
    notifyListeners();
  }

  setDataError(String error) {
    _error = error;
  }

  getdata() async {
    setLoading(true);
    var response = await DataService.getData();
    if (response is Success) {
      Ggdata res = await response.response as Ggdata;
      print(res.data);
      await setDataList(res.data);
    }
    if (response is Failure) {
      Failure(code: response.code, response: response.response);
      setDataError(response.response.toString());
    }
    setLoading(false);
  }
}
