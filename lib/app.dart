import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'core/themes/app_colors.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      theme: ThemeData(
        primaryColor: AppColors.appMaterialColor,
        backgroundColor: AppColors.black,
        appBarTheme: const AppBarTheme(
          color: AppColors.primary,
          toolbarHeight: 40,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AppColors.secundary,
            elevation: 1,
          ),
        ),
      ),
    );
  }
}
