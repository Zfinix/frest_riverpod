import 'package:flutter/cupertino.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:frest/utils/margin.dart';
import 'package:frest/utils/url.dart';
import 'package:frest/widgets/loader.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future customDialog(context, {@required String clientId}) {
  return showCupertinoModalBottomSheet(
    context: context,
    builder: (BuildContext context, scrollController) => Container(
      height: context.screenHeight(0.9),
      width: context.screenWidth(),
      child: Padding(
        padding: const EdgeInsets.only(top: 11),
        child: WebviewScaffold(
          url: APIUrl.authorize(clientId),
          withZoom: true,
          withLocalStorage: true,
          hidden: true,
          appCacheEnabled: true,
          initialChild: Container(
            child: const Center(
              child: Loader(),
            ),
          ),
        ),
      ),
    ),
  );
}
