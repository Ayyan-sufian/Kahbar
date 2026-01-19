import 'package:flutter/material.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/views/congratulations_screen.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:kabar/views/widgets/custom_login_button.dart';

class RestPassScreen extends StatefulWidget {
  const RestPassScreen({super.key});

  @override
  State<RestPassScreen> createState() => _RestPassScreenState();
}

class _RestPassScreenState extends State<RestPassScreen> {
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  bool isVisible = true;
  bool isConfirmVisible = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: isPortrait ? size.height - 60 : size.height * 1.3,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                SizedBox(height: 16),
                Text(
                  AppConstants.rpsHeadingTxt,
                  style: Theme.of(context).textTheme.headlineLarge,
                  maxLines: 2,
                ),
                SizedBox(height: 13),
                Text(
                  AppConstants.rpsNewPassTxt,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextField(
                  controller: newPassController,
                    decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmVisible = !isConfirmVisible;
                      });
                    },
                  ),
                )),
                SizedBox(height: 16),
                Text(
                  AppConstants.rpsConfirmNewPassTxt,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextField(
                  obscureText: isVisible,
                  controller: confirmPassController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                    ),
                    error: newPassController.text != confirmPassController.text
                        ? Row(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: AppTheme.errorColor,
                              ),
                              SizedBox(width: 5),
                              Text(
                                AppConstants.suPassNotSameTxt,
                                style: Theme.of(context).textTheme.bodySmall!
                                    .copyWith(color: AppTheme.errorColor),
                              ),
                            ],
                          )
                        : null,
                  ),
                ),
                Spacer(),
                CustomLoginButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CongratulationsScreen(),
                      ),
                    );
                  },
                  buttonTitle: AppConstants.rpsBtnTxt,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
