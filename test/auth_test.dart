/* import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:frest/main.dart';
import 'package:frest/view_models/login_vm.dart';
import 'package:provider/provider.dart';

main() {
  testWidgets('Provider.of', (tester) async {
    await tester.pumpWidget(
      Provider<LoginViewModel>(
        create: (_) => LoginViewModel(),
        child: MyApp(),
      ),
    );

   final BuildContext childContext = tester.element(find.byType(MyApp));
    var provider = childContext.read<LoginViewModel>();
    provider.loadKeys();
    expect(provider.secretKeys.clientId, isNotNull);
  });
}
 */