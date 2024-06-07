import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'core/service/storage_service.dart';
import 'core/service/theme_service.dart';
import 'presentation/main_tab/main_tab.dart';
import 'presentation/sign_in/sign_in_screen.dart';
import 'routes/routes.dart';
import 'theme/theme_service.dart';
import 'theme/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Dokan',
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        debugShowCheckedModeBanner: false,
        getPages: AppRoutes.routes,
        initialRoute:
            getCurrentUser() != null ? AppRoutes.mainTab : AppRoutes.signIn,
      );
    });
  }
}
