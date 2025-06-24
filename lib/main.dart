import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/core/theme/theme_provider.dart';
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
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
    ],
    child: MyApp(), 
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomepageScreen()
    );
  }
}
