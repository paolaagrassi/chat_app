import 'package:chat_app/auth/core/services/services.dart';
import 'package:chat_app/shared/controllers/base_controller.dart';
import 'package:flutter/material.dart';

abstract class LoginController extends BaseController {
  Future<bool> login(String emailAddress, String password);

  late TextEditingController emailTextEditingController =
      TextEditingController();

  late TextEditingController passwordTextEditingController =
      TextEditingController();
}

class LoginControllerImpl implements LoginController {
  final UserService userService;

  LoginControllerImpl({
    required this.userService,
  });

  @override
  late TextEditingController emailTextEditingController =
      TextEditingController();

  @override
  late TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  Future<bool> login(String emailAddress, String password) async {
    final result = await userService.login(emailAddress, password);

    return result.isSuccess;
  }
}
