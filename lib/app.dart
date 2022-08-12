import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greate_places/core/themes/app_text_style.dart';
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
        scaffoldBackgroundColor: AppColors.black,
        appBarTheme: AppBarTheme(
          titleTextStyle: AppTextStyle.appBarTitle,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
          ),
          color: AppColors.primary,
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
