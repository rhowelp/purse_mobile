import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/core/widgets/custom_button.dart';
import 'package:purse_mobile/core/widgets/custom_textformfield.dart';

class ForgotPasswordView extends StatefulWidget {
  static const route = 'ForgotPasswordView';
  static const routeName = 'ForgotPasswordView';
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalette.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 130,
            child: Container(
              color: ColorPalette.backgroundColor,
              child: Column(
                children: [
                  const Gap(70),
                  Row(
                    children: [
                      const Gap(5),
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(
                          Icons.chevron_left_rounded,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                      const Gap(20),
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(50),
                  Text(
                    'Forgot Password',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    'Enter the email address you used when you joined and we\'ll send you instructions to rest your password.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Gap(30),
                  Text('Email Address'),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: 'Enter your Email',
                    validator: (value) =>
                        value!.isEmpty ? 'Email is required ' : null,
                  ),
                  const Spacer(),
                  CustomButton(
                    onTap: () {},
                    buttonColor: ColorPalette.primary,
                    titleColor: Colors.white,
                    buttonText: 'Continue',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
