import 'package:flutter/material.dart';
import 'package:frest/utils/theme.dart';

class Loader extends StatelessWidget {
  const Loader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: 70,
          height: 4,
          color: primary.withOpacity(0.9),
          child: LinearProgressIndicator(),
        ),
    );
  }
}
