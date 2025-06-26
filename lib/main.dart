import 'package:flutter/material.dart';
import 'package:kanji_no_yarikata_mobile/core/theme/theme_provider.dart';
import 'package:kanji_no_yarikata_mobile/data/datasources/kanji_database.dart';
import 'package:kanji_no_yarikata_mobile/data/models/search_filter.dart';
import 'package:kanji_no_yarikata_mobile/data/models/settings.dart';
import 'package:kanji_no_yarikata_mobile/presentation/pages/homepage.dart';
import 'package:kanji_no_yarikata_mobile/providers/kanji_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final kanjiDatabase = KanjiDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SettingsModel()),
        ChangeNotifierProvider(create: (context) => SearchFilterModel()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => KanjiProvider(repository: kanjiDatabase,)),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomepageScreen(),
    );
  }
}
