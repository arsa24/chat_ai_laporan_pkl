import 'package:google_fonts/google_fonts.dart';
import 'package:chat_ai/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        textTheme: GoogleFonts.kodchasanTextTheme(),
        scaffoldBackgroundColor: Color(0xff171717),
        appBarTheme: AppBarTheme(color: Color(0xff171717)),
      ),
      home: HomeScreen(),
    );
  }
}
