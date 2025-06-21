import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanji_no_yarikata_mobile/models/settings.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/homepage.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (context) => SettingsModel(),
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white70,
          primary: Color.fromRGBO(45, 45, 45, 1),
        ),
        textTheme: GoogleFonts.rubikTextTheme(),
      ),
      home: HomepageScreen()
    );
  }
}
