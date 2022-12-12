// ignore_for_file: must_be_immutable

import 'package:chat_app/chat/views/chat_room.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:validatorless/validatorless.dart';

import 'package:chat_app/auth/controllers/controllers.dart';
import 'package:chat_app/auth/views/views.dart';
import 'package:chat_app/auth/views/widgets/widgets.dart';
import 'package:chat_app/shared/widgets/widgets.dart';

class LoginPageView extends WidgetState<LoginController> {
  LoginPageView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isAuthFormValid = useState(false);

    ValueNotifier<bool> isHiden = useState(true);

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/login-image.png',
                  height: 200,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Form(
                        key: _formKey,
                        onChanged: () {
                          final isFormValid = _formKey.currentState!.validate();

                          if (isAuthFormValid.value != isFormValid) {
                            isAuthFormValid.value = isFormValid;
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomTextField(
                              hintText: 'Email',
                              controller: controller.emailTextEditingController,
                              validator: Validatorless.multiple([
                                Validatorless.required('Field cannot be null')
                              ]),
                              obscureText: false,
                            ),
                            CustomTextField(
                              hintText: 'Password',
                              controller:
                                  controller.passwordTextEditingController,
                              validator: Validatorless.multiple([
                                Validatorless.required('Field cannot be null')
                              ]),
                              obscureText: isHiden.value,
                              suffixIcon: CustomObscureTextGestureDetector(
                                obscureText: isHiden.value,
                                onTap: () {
                                  isHiden.value = !isHiden.value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomButton(
                            buttonLabel: 'Sign In',
                          ).buildButton(
                            false,
                            null,
                            null,
                            isAuthFormValid.value
                                ? () {
                                    final emailTextEditingController =
                                        controller
                                            .emailTextEditingController.text;
                                    final passwordTextEditingController =
                                        controller
                                            .passwordTextEditingController.text;

                                    controller
                                        .login(emailTextEditingController,
                                            passwordTextEditingController)
                                        .then((value) {
                                      if (value) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ChatRoom(),
                                          ),
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                          msg:
                                              'Please enter with a valid email/password',
                                          backgroundColor: const Color.fromARGB(
                                              179, 173, 12, 0),
                                          gravity: ToastGravity.BOTTOM,
                                        );
                                      }
                                    });
                                  }
                                : null,
                          ),
                          Row(
                            children: const [
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  endIndent: 20.0,
                                  indent: 10.0,
                                ),
                              ),
                              CustomText(
                                text: 'or continue with',
                                color: Colors.grey,
                              ),
                              Expanded(
                                child: Divider(
                                  thickness: 1,
                                  endIndent: 20.0,
                                  indent: 10.0,
                                ),
                              ),
                            ],
                          ),
                          CustomButton(
                            buttonLabel: 'Sign In With Google',
                            assetPath: 'assets/google-icon.png',
                          ).buildButton(
                            false,
                            Colors.black,
                            Colors.white,
                            () {
                              GoogleSignIn().signIn();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: "Don't have an account?",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterPageView(),
                                ),
                              );
                            },
                            child: const Text('Register'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
