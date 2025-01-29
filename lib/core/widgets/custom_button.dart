import 'package:flutter/material.dart';
import 'package:purse_mobile/core/domain/constants/color_palette.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.child,
    this.buttonHeight = 55,
    this.borderRadius = 30,
    this.buttonColor,
    this.titleColor,
    this.gradient,
    this.boxBorder,
    required this.onTap,
    required this.buttonText,
  });

  final String buttonText;
  final Widget? child;
  final Function() onTap;
  final double? buttonHeight;
  final double? borderRadius;
  final Color? buttonColor;
  final Color? titleColor;
  final Gradient? gradient;
  final BoxBorder? boxBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 30),
        border: boxBorder,
        color: buttonColor ?? ColorPalette.primary,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: child ??
              Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: titleColor ?? Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
