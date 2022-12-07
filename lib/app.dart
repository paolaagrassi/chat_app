import 'package:flutter/material.dart';

import 'home/home_page_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: const Color.fromARGB(255, 111, 50, 253)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 136, 22, 230),
        ),
        scaffoldBackgroundColor: Colors.grey[100],
        shadowColor: const Color.fromARGB(255, 96, 12, 231),
      ),
      home: const HomePageView(),
    );
  }
}
