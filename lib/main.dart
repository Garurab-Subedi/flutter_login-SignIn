import 'package:flutter/material.dart';
import 'package:hello_app/pages/home_page.dart';
import 'package:hello_app/pages/login_page.dart';
import 'package:hello_app/utils/routes.dart';
import 'package:hello_app/pages/register_page.dart';
import 'package:hello_app/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => const registerPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.registerRoute: (context) => const registerPage(),
      },
    );
  }
}
