import 'package:chat_app/auth/controllers/controllers.dart';
import 'package:chat_app/auth/views/views.dart';
import 'package:chat_app/auth/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:validatorless/validatorless.dart';

import '../../shared/widgets/widgets.dart';

class RegisterPageView extends WidgetState<RegisterController> {
  RegisterPageView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isAuthFormValid = useState(false);

    ValueNotifier<bool> isHiden = useState(true);

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      CustomText(
                        text: 'Create account,',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: 'Sign up to start!',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
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
                          hintText: 'Name',
                          controller: controller.userNameTextEditingController,
                          obscureText: false,
                          validator: Validatorless.multiple(
                              [Validatorless.required('Field cannot be null')]),
                        ),
                        CustomCalendarField(
                            controller:
                                controller.userBirthTextEditingController),
                        CustomTextField(
                          hintText: 'Email',
                          controller: controller.emailTextEditingController,
                          obscureText: false,
                          validator: Validatorless.multiple(
                              [Validatorless.required('Field cannot be null')]),
                        ),
                        CustomTextField(
                          hintText: 'Password',
                          controller: controller.passwordTextEditingController,
                          obscureText: isHiden.value,
                          validator: Validatorless.multiple(
                              [Validatorless.required('Field cannot be null')]),
                        ),
                        CustomTextField(
                          hintText: 'Confirm password',
                          controller:
                              controller.passwordConfirmTextEditingController,
                          obscureText: isHiden.value,
                          suffixIcon: CustomObscureTextGestureDetector(
                            obscureText: isHiden.value,
                            onTap: () {
                              isHiden.value = !isHiden.value;
                            },
                          ),
                          validator: Validatorless.multiple(
                              [Validatorless.required('Field cannot be null')]),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    children: [
                      CustomButton(
                        buttonLabel: 'Sign Up',
                      ).buildButton(
                        false,
                        null,
                        null,
                        isAuthFormValid.value
                            ? () {
                                final userBirthTextEditingController =
                                    controller
                                        .userBirthTextEditingController.text;

                                final userNameTextEditingController = controller
                                    .userNameTextEditingController.text;

                                final passwordConfirmTextEditingController =
                                    controller
                                        .passwordConfirmTextEditingController
                                        .text;

                                var passwordTextEditingController = controller
                                    .passwordTextEditingController.text;

                                final emailTextEditingController =
                                    controller.emailTextEditingController.text;

                                bool isPasswordConfirmed =
                                    passwordConfirmTextEditingController ==
                                        passwordTextEditingController;

                                if (isPasswordConfirmed) {
                                  passwordTextEditingController =
                                      passwordConfirmTextEditingController;

                                  controller
                                      .registerUser(
                                    emailTextEditingController,
                                    passwordTextEditingController,
                                    userNameTextEditingController,
                                    userBirthTextEditingController,
                                    emailTextEditingController,
                                  )
                                      .then(
                                    (value) {
                                      if (value) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                LoginPageView(),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                    msg: 'The passwords must be equals',
                                    backgroundColor:
                                        const Color.fromARGB(179, 173, 12, 0),
                                    gravity: ToastGravity.BOTTOM,
                                  );
                                }
                              }
                            : null,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomText(
                            text: 'Already have an account?',
                            color: Colors.grey,
                          ),
                          TextButton(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPageView(),
                                ),
                              );
                            },
                            child: const Text('Sign In'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
