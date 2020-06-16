import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:frest/view_models/home_vm.dart';
import 'package:frest/view_models/login_vm.dart';

final registerProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => HomeViewModel()),
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
];
