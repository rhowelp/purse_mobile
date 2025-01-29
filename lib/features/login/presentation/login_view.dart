import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/core/widgets/custom_button.dart';
import 'package:purse_mobile/core/widgets/custom_textformfield.dart';
import 'package:purse_mobile/features/signup/presentation/signup_view.dart';

class LoginView extends StatefulWidget {
  static const route = 'LoginView';
  static const routeName = 'LoginView';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorPalette.backgroundColor,
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(size.height * 0.2),
              Hero(
                tag: 'logo',
                child: Image.asset('assets/images/purse_logo.png'),
              ),
              const Gap(50),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Login with your account to continue',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Gap(20),
              Text('Email Address'),
              CustomTextFormField(
                controller: emailController,
                hintText: 'Enter your Email',
                validator: (value) =>
                    value!.isEmpty ? 'Email is required ' : null,
              ),
              const Gap(20),
              Text('Password'),
              CustomTextFormField(
                controller: passwordController,
                hintText: 'Enter your Password',
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Password is required ' : null,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              CustomButton(
                onTap: () {},
                buttonText: 'Login',
                titleColor: Colors.black,
              ),
              const Gap(30),
              Center(
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account?\n',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: 'Sign Up',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: ColorPalette.primary,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.pushNamed(SignupView.routeName);
                              },
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
