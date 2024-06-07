import 'package:get/get.dart';

import '../presentation/main_tab/main_tab.dart';
import '../presentation/sign_in/sign_in_screen.dart';
import '../presentation/sign_up/sign_up_screen.dart';

class AppRoutes {
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String mainTab = '/main-tab';

  static List<GetPage> routes = [
    GetPage(
      name: signIn,
      page: () => SignInPage(),
    ),
    GetPage(
      name: signUp,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: mainTab,
      page: () => MainPage(),
    ),
  ];
}
