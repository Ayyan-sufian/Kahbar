import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../model_view/theme_provider.dart';

class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
    super.key,
    required this.themeProvider,
    required this.buttonTitle,
    required this.onPressed,
    required this.imgPath,
  });

  final ThemeProvider themeProvider;
  final String buttonTitle;
  final VoidCallback onPressed;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 174,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: themeProvider.isDark(context)
              ? Color(0xFFEEF1F4)
              : Color(0xFFEEF1F4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/img/$imgPath"),
            SizedBox(width: 5),
            Text(
              buttonTitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Color(0xFF667080),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
