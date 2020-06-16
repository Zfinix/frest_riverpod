import 'package:flutter/material.dart';
import 'package:frest/core/api/auth.dart';
import 'package:frest/models/repos_model.dart';

class HomeViewModel extends ChangeNotifier {
  bool isLoading = false;
  ReposListModel reposModel;

  void getRepos(context, String token) async {
    try {
      isLoading = true;
      var temp = await Auth.getRepos(context, token: token);
      if (temp != null) {
        reposModel = temp;
      }
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      notifyListeners();
      print(e.toString());
    }
  }
}
