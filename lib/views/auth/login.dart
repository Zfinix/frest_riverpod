import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:frest/utils/margin.dart';
import 'package:frest/utils/theme.dart';
import 'package:frest/view_models/login_vm.dart';
import 'package:frest/widgets/dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final wv = new FlutterWebviewPlugin();

  StreamSubscription _onDestroy;
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  @override
  void dispose() {
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    wv.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    var tempProvider = context.read<LoginViewModel>();
    tempProvider.loadKeys();
    wv.close();
    // Add a listener to on url changed
    _onUrlChanged = wv.onUrlChanged.listen((String url) async {
      print(url);
      tempProvider.intercept(context, mounted, url, wv);
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<LoginViewModel>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
        ),
      ),
      backgroundColor: bgColor,
      body: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              LineIcons.github_alt,
              color: white,
              size: 44,
            ),
            const YMargin(10),
            Text('Sign in with Github',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: white,
                    height: 1.5,
                    fontSize: 23,
                  ),
                )),
            const YMargin(10),
            Text(
                'A demo project to show a simle implementation of Github OAuth',
                style: GoogleFonts.sourceCodePro(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: white.withOpacity(.4),
                    height: 1.5,
                    fontSize: 12,
                  ),
                )),
            Spacer(),
            Center(
                child: Image.asset(
              'assets/images/login.png',
              height: 200,
            )),
            Spacer(),
            Container(
              width: double.infinity,
              height: 56,
              child: FlatButton.icon(
                color: primary,
                icon: Icon(
                  LineIcons.github,
                  color: white,
                ),
                label: Text('Sign in with Github '),
                onPressed: () async {
                  if (provider?.secretKeys?.clientId != null)
                    await customDialog(context,
                        clientId: provider.secretKeys?.clientId);
                },
              ),
            ),
            YMargin(context.screenHeight(0.02))
          ],
        ),
      ),
    );
  }
}
