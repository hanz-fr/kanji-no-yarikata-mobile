import 'package:flutter/material.dart';

/// Flutter code sample for [AppBar].

void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AppBarExample());
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('This is a snackbar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(title: const Text('Next page')),
                      body: Column(
                        children: [
                          Card(
                            margin: EdgeInsets.all(10.0),
                            elevation: 1,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text("Test"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text("Test"),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text("Test"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),  
        ],
      ),
      body: const Center(child: Text('This is the home page', style: TextStyle(fontSize: 24))),
    );
  }
}