import 'package:chat_app/auth/views/views.dart';
import 'package:chat_app/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          CustomTextField(hintText: 'Email'),
                          CustomTextField(
                            suffixIcon: Icon(Icons.visibility),
                            hintText: 'Password',
                          ),
                        ],
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
                            () {},
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
                            () {},
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
                                  builder: (context) =>
                                      const RegisterPageView(),
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
