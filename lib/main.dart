import 'package:chat_app/auth/controllers/controllers.dart';
import 'package:chat_app/auth/core/repositories/repositories.dart';
import 'package:chat_app/auth/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kiwi/kiwi.dart';
import 'firebase_options.dart';

import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  KiwiContainer container = KiwiContainer();

  //repositories
  container.registerSingleton<UserRepository>(
    (container) => UserRepositoryImpl(),
  );

  //services
  container.registerSingleton<UserService>(
    (container) => UserServiceImpl(
      userRepository: container.resolve<UserRepository>(),
    ),
  );

  //controllers
  container.registerFactory<LoginController>(
    (container) => LoginControllerImpl(
      userService: container.resolve<UserService>(),
    ),
  );

  container.registerFactory<RegisterController>(
    (container) => RegisterControllerImpl(
      userService: container.resolve<UserService>(),
    ),
  );

  runApp(const AppWidget());
}
