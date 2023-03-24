import 'package:auth_app/app/pages/login/controller/login_controller.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static final providers = [
    ChangeNotifierProvider<LoginController>(
      create: (_) => LoginController(),
    ),
  ];
}
