import 'package:auth_app/app/core/ui/styles/colors_app.dart';
import 'package:auth_app/app/core/ui/styles/text_app.dart';
import 'package:flutter/material.dart';

class ElevatedButtomGradient extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry? borderRadius;
  final Size? size;
  const ElevatedButtomGradient({
    super.key,
    required this.text,
    this.onPressed,
    this.borderRadius,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width ?? double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            context.colorsApp.primaryColorDark,
            context.colorsApp.primaryColor,
            context.colorsApp.primaryColorLight,
          ],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Text(text, style: context.textStyles.textBold.copyWith(fontSize: 16, color: Colors.white)),
      ),
    );
  }
}
