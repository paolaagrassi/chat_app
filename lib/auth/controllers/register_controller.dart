// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/shared/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../core/services/services.dart';

abstract class RegisterController extends BaseController {
  Future<bool> registerUser(String emailAddress, String password,
      String userName, String userBirth, String userEmail);

  Future uploadProfilePicture(
      XFile? imagePath, bool uploadingStatus, double totalBytes);

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

  String? validateName(String? name);
  String? validateEmailAddress(String? emailAddress);
  String? validatePassword(String? password);
  String? confirmPassword(String password, String? confirmPassword);
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

  @override
  Future uploadProfilePicture(
      XFile? imagePath, bool uploadingStatus, double totalBytes) async {
    final result = await userService.uploadProfilePicture(
        imagePath, uploadingStatus, totalBytes);

    return result;
  }

  @override
  String? validateName(String? name) =>
      (name != null && name.isNotEmpty) ? null : "Please, name can't be null.";

  @override
  String? validateEmailAddress(String? emailAddress) => (emailAddress != null &&
          emailAddress.isNotEmpty &&
          emailAddress.contains('@'))
      ? null
      : "Please, email can't be null.";

  @override
  String? validatePassword(String? password) =>
      password != null && password.length > 5
          ? null
          : 'Please, the password must be at least 6 characters.';

  @override
  String? confirmPassword(String password, String? confirmPassword) =>
      password == confirmPassword
          ? null
          : 'Please, the passwords must be equal.';
}
