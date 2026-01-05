import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton({
    super.key, required this.onPressed,
    required this.buttonTitle
  });

  final String buttonTitle;
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(onPressed: onPressed, child: Text(buttonTitle)),
    );
  }
}
