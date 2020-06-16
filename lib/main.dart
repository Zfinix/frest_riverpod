import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:frest/services/register_providers.dart';
import 'package:frest/utils/theme.dart';
import 'package:frest/views/auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: registerProviders,
      child: MaterialApp(
        title: 'frest',
        debugShowCheckedModeBanner: false,
        theme: themeData(context),
        home: Login(),
      ),
    );
  }
}
