import 'package:desenvolvimento_flutter_iniciante/controllers/theme_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/router.dart';
import 'package:desenvolvimento_flutter_iniciante/routes/routes.dart';
import 'package:desenvolvimento_flutter_iniciante/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = GetIt.instance<ThemeController>();
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: Routes.initialRoute,
          routes: getApplicationRoutes(),
          title: 'Flutter Demo',
          theme: themeController.isLightTheme == true ? lightTheme : darkTheme,
          );
      }
    );
  }
}