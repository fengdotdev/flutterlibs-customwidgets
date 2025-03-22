import 'package:customwidgets/src/basic/dynamic_text.dart';
import 'package:flutter/material.dart';

abstract interface class LoginboxInterface {
  TextEditingController get userController;
  TextEditingController get passwordController;
  TextEditingController get error;
  Function(BuildContext context) get login;
}



class LoginBox extends StatelessWidget implements LoginboxInterface {
  // Styling box
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double? elevation;
  final double? margin;
  final Color? backgroundColorBox;
  
  // Styling textfield
  final Color? textFieldColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  
  // Styling dynamic text or error text
  final Color? errorColor;
  final double? errorFontSize;

  @override
  final TextEditingController userController;
  @override
  final TextEditingController passwordController;
  @override
  final TextEditingController error;
  @override
  final Function(BuildContext context) login;

  const LoginBox({
    super.key,
    required this.userController,
    required this.passwordController,
    required this.login,
    required this.error,
    this.backgroundColorBox,
    this.textFieldColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.margin,
    this.errorColor,
    this.errorFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(16.0),
      child: Card(
        elevation: elevation ?? 0,
        shape: borderRadius != null
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius!))
            : null,
        margin: margin != null
            ? EdgeInsets.all(margin!)
            : const EdgeInsets.all(0),
        child: Container(
          color: backgroundColorBox ?? Colors.white,
          padding: padding ?? const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: userController,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  fontFamily: fontFamily,
                ),
                decoration: InputDecoration(
                  hintText: 'Username',
                  fillColor: textFieldColor,
                  filled: textFieldColor != null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                obscureText: true,
                controller: passwordController,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  fontFamily: fontFamily,
                ),
                decoration: InputDecoration(
                  hintText: 'Password',
                  fillColor: textFieldColor,
                  filled: textFieldColor != null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 4.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => login(context),
                child: const Text('Login'),
              ),
              const SizedBox(height: 8.0),
              DynamicText(
                controller: error,
                style: errorColor != null || errorFontSize != null
                    ? TextStyle(
                        color: errorColor,
                        fontSize: errorFontSize,
                      )
                    : null,
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}