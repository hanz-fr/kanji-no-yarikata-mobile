import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/kanji_provider.dart';
import 'all_kanji/all_kanji.dart';
import 'package:kanji_no_yarikata_mobile/core/theme/theme.dart';
import 'package:kanji_no_yarikata_mobile/core/theme/theme_provider.dart';
import 'package:kanji_no_yarikata_mobile/presentation/widgets/dialog/filter_dialog.dart';
import 'package:kanji_no_yarikata_mobile/presentation/widgets/dialog/settings_dialog.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  
  /* Function to load all the kanji data only once when app launched */
  bool _initialized = false;
  late Future<void> _loadAllKanjiFuture;

  @override
  void initState() {
    super.initState();
    _loadAllKanjiFuture = _loadKanjiOnce();
  }

  Future<void> _loadKanjiOnce() async {
    if (!_initialized) {
      await Provider.of<KanjiProvider>(context, listen: false).loadAllKanji();
      _initialized = true;
    }
  }

  void _navigateToAllKanjiPage(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => AllKanjiScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Icon toggleThemeIcon = (Provider.of<ThemeProvider>(context, listen: false).themeData == lightMode) ? Icon(Icons.dark_mode_outlined) : Icon(Icons.light_mode_outlined);

    return FutureBuilder(
      future: _loadAllKanjiFuture,
      builder: (context, asyncSnapshot) {
        
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          bottomNavigationBar: BottomAppBar(
            color: Colors.transparent,
            elevation: 0,
            child: Center(
              child: TextButton(
                onPressed: () {
                  _navigateToAllKanjiPage(context);
                },
                child: Text(
                  "All Kanji List",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(208, 208, 208, 1)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                    },
                    icon: toggleThemeIcon,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(208, 208, 208, 1)),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SettingsDialog();
                        },
                      );
                    },
                    icon: const Icon(Icons.settings_outlined),
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 30,
            children: [
              const Text(
                "漢字のやり方",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsetsGeometry.symmetric(horizontal: 35.0),
                child: SizedBox(
                  width: double.infinity,
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.tune_rounded),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return FilterDialog();
                            },
                          );
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: 'Search kanji...',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
