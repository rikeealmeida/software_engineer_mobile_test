import 'package:desafio_software_engineer_mobileflutter/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getStringList('favorites') == null) {
    prefs.setStringList('favorites', []);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          shadowColor: Colors.white,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          foregroundColor: Color(0xff37474f),
          titleTextStyle: TextStyle(
            fontSize: 20,
            height: 1.5,
            fontWeight: FontWeight.w600,
            color: Color(0xff37474f),
          ),
          centerTitle: false,
        ),
      ),
      home: const HomePage(),
    );
  }
}
