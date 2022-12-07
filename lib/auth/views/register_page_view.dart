import 'package:chat_app/auth/views/views.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/widgets.dart';

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({super.key});

  @override
  State<RegisterPageView> createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
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
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CustomTextField(hintText: 'Name'),
                      CustomTextField(hintText: 'Email'),
                      CustomTextField(
                        suffixIcon: Icon(Icons.visibility),
                        hintText: 'Password',
                      ),
                      CustomTextField(
                        suffixIcon: Icon(Icons.visibility),
                        hintText: 'Confirm password',
                      ),
                    ],
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
                        () {},
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
                                  builder: (context) => const LoginPageView(),
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
