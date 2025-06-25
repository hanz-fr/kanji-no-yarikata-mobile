import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'all_kanji/all_kanji.dart';
import 'package:kanji_no_yarikata_mobile/core/theme/theme.dart';
import 'package:kanji_no_yarikata_mobile/core/theme/theme_provider.dart';
import 'package:kanji_no_yarikata_mobile/domain/entities/inu.dart';
import 'package:kanji_no_yarikata_mobile/providers/kanji_provider.dart';
import 'package:kanji_no_yarikata_mobile/providers/inu_provider.dart';
import 'package:kanji_no_yarikata_mobile/presentation/widgets/dialog/filter_dialog.dart';
import 'package:kanji_no_yarikata_mobile/presentation/widgets/dialog/settings_dialog.dart';


class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  void _navigateToAllKanjiPage(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => AllKanjiScreen()));
  }

  @override
  Widget build(BuildContext context) {

    Icon toggleThemeIcon = (Provider.of<ThemeProvider>(context, listen: false).themeData == lightMode) ? Icon(Icons.dark_mode_outlined) : Icon(Icons.light_mode_outlined);
    final dogProvider = Provider.of<DogProvider>(context);
    final kanjiProvider = Provider.of<KanjiProvider>(context);

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
                icon: Icon(Icons.settings_outlined),
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
          Text(
            "漢字のやり方",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 35.0),
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
          ElevatedButton(
            onPressed: () {
              dogProvider.addDog(Dog(id: 1, name: 'Buddy', age: 3));
            },
            child: const Text("Add Dog"),
          ),
          ElevatedButton(
            onPressed: () {
              kanjiProvider.loadKanji();
            },
            child: const Text("Get all Kanji"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dogProvider.dogs.length,
              itemBuilder: (context, index) {
                final dog = dogProvider.dogs[index];
                return ListTile(
                  title: Text(dog.name),
                  subtitle: Text('Age: ${dog.age}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
