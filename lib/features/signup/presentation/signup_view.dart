import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_field/intl_phone_number_field.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';
import 'package:purse_mobile/core/widgets/custom_button.dart';
import 'package:purse_mobile/core/widgets/custom_textformfield.dart';

class SignupView extends StatefulWidget {
  static const route = 'SignupView';
  static const routeName = 'SignupView';
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final formKey = GlobalKey<FormState>();
  final mobileController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(size.height * 0.1),
                Hero(
                  tag: 'logo',
                  child: Image.asset(
                    'assets/images/purse_logo.png',
                    height: 40,
                  ),
                ),
                const Gap(30),
                Text(
                  'Let\'s Get Started!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Enter your details to continue',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Gap(20),
                Text('Mobile Number'),
                InternationalPhoneNumberInput(
                  height: 50,
                  controller: mobileController,
                  inputFormatters: const [],
                  initCountry: CountryCodeModel(
                    name: "Philippines",
                    dial_code: "+63",
                    code: "PH",
                  ),
                  betweenPadding: 10,
                  onInputChanged: (phone) {},
                  dialogConfig: DialogConfig(
                    backgroundColor: ColorPalette.primaryShade,
                    searchBoxBackgroundColor: ColorPalette.primaryLight,
                    searchBoxIconColor: ColorPalette.primary,
                    countryItemHeight: 55,
                    topBarColor: const Color(0xFF1B1C24),
                    selectedItemColor: ColorPalette.primaryLight,
                    selectedIcon: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        "assets/check.png",
                        width: 20,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    searchBoxTextStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                    titleStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    searchBoxHintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  countryConfig: CountryConfig(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: ColorPalette.primaryLight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    noFlag: false,
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  validator: (number) {
                    if (number.number.isEmpty) {
                      return "The phone number cannot be left empty";
                    }
                    return null;
                  },
                  phoneConfig: PhoneConfig(
                    focusedColor: ColorPalette.primaryLight,
                    enabledColor: ColorPalette.primaryLight,
                    errorColor: Colors.red,
                    labelStyle: null,
                    labelText: null,
                    floatingLabelStyle: null,
                    focusNode: null,
                    radius: 30,
                    hintText: "Mobile Number",
                    borderWidth: 1,
                    backgroundColor: Colors.white,
                    decoration: null,
                    popUpErrorText: true,
                    autoFocus: false,
                    showCursor: false,
                    textInputAction: TextInputAction.done,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    errorTextMaxLength: 2,
                    errorPadding: const EdgeInsets.only(top: 14),
                    errorStyle: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      height: 1,
                    ),
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const Gap(20),
                Text('First Name'),
                CustomTextFormField(
                  controller: firstNameController,
                  hintText: 'Enter your First Name',
                  validator: (value) =>
                      value!.isEmpty ? 'First Name is required' : null,
                ),
                const Gap(20),
                Text('Last Name'),
                CustomTextFormField(
                  controller: lastNameController,
                  hintText: 'Enter your Last Name',
                  validator: (value) =>
                      value!.isEmpty ? 'Last Name is required' : null,
                ),
                const Gap(20),
                Text('Email Address'),
                CustomTextFormField(
                  controller: emailController,
                  hintText: 'Enter your Email',
                  validator: (value) =>
                      value!.isEmpty ? 'Email is required' : null,
                ),
                const Gap(20),
                Text('Password'),
                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'Enter your Password',
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Password is required' : null,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: Center(
                        child: Column(
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account? ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Login',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: ColorPalette.primary,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => context.pop(),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                ),
                const Gap(20),
                CustomButton(
                  onTap: () {},
                  buttonText: 'Sign Up',
                  titleColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
