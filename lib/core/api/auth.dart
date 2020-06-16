import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:frest/const/secrets.dart';
import 'package:frest/models/repos_model.dart';
import 'package:frest/models/token_model.dart';
import 'package:frest/utils/url.dart';
import 'package:http/http.dart' as http;

class Auth {
  static Future<TokenModel> authorize(
    context, {
    @required Secret secret,
  }) async {
    try {
      var headers = {
        'Content-type': 'application/json;charset=UTF-8',
        'Accept': 'application/json;charset=UTF-8',
      };

      var response = await http.post(APIUrl.accessToken,
          body: json.encode(secret.toJson()), headers: headers);

      if (response.body != null &&
          response.statusCode == 200 &&
          response.body.contains('access_token')) {
        return TokenModel.fromJson(json.decode(response.body));
      } else {
        showCupertinoDialog(
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text('Error!'),
                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('Oops an Error Occurred'),
                ),
                actions: <Widget>[
                  CupertinoButton(
                    child: Text('Close'),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
            context: context);
      }

      return null;
    } catch (e) {
      showCupertinoDialog(
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text('Oops'),
              content: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text('An Error Occurred'),
              ),
              actions: <Widget>[
                CupertinoButton(
                  child: Text('Seen'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          },
          context: context);

      print(e.toString());
    }
    return null;
  }

  static Future<ReposListModel> getRepos(
    context, {
    @required String token,
  }) async {
    try {
      var headers = {
        'Authorization': "token $token",
        'Content-type': 'application/json;charset=UTF-8',
        'Accept': 'application/json',
      };

      var response = await http.get(APIUrl.getUserRepo, headers: headers);
      print(response.body);
      if (response.body != null && response.body.contains('followers_url')) {
        return ReposListModel.fromJson(
            json.decode('{"data":${response.body}}'));
      } else {
        showCupertinoDialog(
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: Text('Error!'),
                content: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('UNAUTHENTICATED'),
                ),
                actions: <Widget>[
                  CupertinoButton(
                    child: Text('Seen'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            },
            context: context);
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
