import 'package:chat_app/auth/views/views.dart';
import 'package:chat_app/home/home_page_view.dart';
import 'package:flutter/material.dart';

import 'chat/views/views.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

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
      initialRoute: '/home',
      routes: {
        '/login': (context) => LoginPageView(),
        '/register': (context) => RegisterPageView(),
        '/register-profile': (context) => RegisterProfilePageView(),
        '/home': (context) => const HomePageView(),
        '/chat-room': (context) => const ChatRoomView(),
      },
    );
  }
}
