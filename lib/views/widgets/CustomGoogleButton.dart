import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar/model_view/theme_bloc/theme_bloc.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:svg_flutter/svg_flutter.dart';


class CustomGoogleButton extends StatelessWidget {
  const CustomGoogleButton({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    required this.imgPath,
  });

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
          backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppTheme.darkModeWhite
            : AppTheme.blackColor,
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
