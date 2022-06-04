import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralProvider with ChangeNotifier {
  List<String> _listScans = [];

  List<String> get listScans => _listScans;

  set listScans(List<String> value) {
    _listScans = value;
    notifyListeners();
  }

  void saveScan(String scan) {
    _listScans.add(scan);
    notifyListeners();
  }

  void cleanList() {
    _listScans.clear();
    notifyListeners();
  }

  void deleteScan(int index) {
    _listScans.removeAt(index);
    notifyListeners();
  }

  bool validateUrl(String data) {
    return Uri.tryParse(data)?.hasAbsolutePath ?? false;
  }

  Future<bool> openLink(String url) async {
    try {
      return await launch(url, forceSafariVC: true, forceWebView: true);
    } catch (onError) {
      // print('ERROR >> $onError');
      viewToast('La URL seleccionada no es esta disponible.');
    }
    return false;
  }

  void viewToast( String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black38,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}
