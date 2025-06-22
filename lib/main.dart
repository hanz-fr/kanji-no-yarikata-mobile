import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kanji_no_yarikata_mobile/data/models/search_filter.dart';
import 'package:kanji_no_yarikata_mobile/data/models/settings.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/homepage.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => SettingsModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchFilterModel(),
      )
    ],
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
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromRGBO(45, 45, 45, 1),
            foregroundColor: Colors.white70,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
            )
          )
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
            )
          )
        )
      ),
      home: HomepageScreen()
    );
  }
}
