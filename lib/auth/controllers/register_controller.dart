// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/shared/controllers/base_controller.dart';
import 'package:flutter/material.dart';

import '../core/services/services.dart';

abstract class RegisterController extends BaseController {
  Future<bool> registerUser(String emailAddress, String password,
      String userName, String userBirth, String userEmail);

  late TextEditingController userNameTextEditingController =
      TextEditingController();

  late TextEditingController userBirthTextEditingController =
      TextEditingController();

  late TextEditingController emailTextEditingController =
      TextEditingController();

  late TextEditingController passwordTextEditingController =
      TextEditingController();

  late TextEditingController passwordConfirmTextEditingController =
      TextEditingController();
}

class RegisterControllerImpl implements RegisterController {
  final UserService userService;

  RegisterControllerImpl({
    required this.userService,
  });

  @override
  late TextEditingController userNameTextEditingController =
      TextEditingController();

  @override
  late TextEditingController userBirthTextEditingController =
      TextEditingController();

  @override
  late TextEditingController emailTextEditingController =
      TextEditingController();

  @override
  late TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  late TextEditingController passwordConfirmTextEditingController =
      TextEditingController();

  @override
  Future<bool> registerUser(String emailAddress, String password,
      String userName, String userBirth, String userEmail) async {
    final result = await userService.registerUser(
        emailAddress, password, userName, userBirth, userEmail);

    return result.isSuccess;
  }
}
