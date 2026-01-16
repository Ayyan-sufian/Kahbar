import 'package:flutter/material.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/views/country_screen.dart';
import 'package:kabar/views/forget_screen.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:kabar/views/widgets/CustomGoogleButton.dart';
import 'package:kabar/views/widgets/CustomLoginButton.dart';
import 'package:kabar/views/sign_up_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;
  bool errorUser = false;
  bool errorPass = false;
  bool remind = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(AppConstants.lgHelloTxt, style: Theme.of(context).textTheme.headlineLarge),
              Text(
                AppConstants.lgAgainTxt,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge!.copyWith(color: Color(0xff1877F2)),
              ),
              SizedBox(height: 10),
              Text(
                AppConstants.lgContentTxt,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 52),
              Text(AppConstants.fPEmailTxt, style: Theme.of(context).textTheme.bodySmall),
              TextField(
                decoration: InputDecoration(
                  helper: errorUser
                      ? Row(
                          children: [
                            Icon(Icons.error_outline, color: AppTheme.errorColor),
                            SizedBox(width: 5),
                            Text(
                              AppConstants.lgInvalidEmailTxt,
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: AppTheme.errorColor),
                            ),
                          ],
                        )
                      : null,
                ),
              ),
              SizedBox(height: 16),
              Text(AppConstants.lgPassTxt, style: Theme.of(context).textTheme.bodySmall),
              TextField(
                obscureText: isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility_off_outlined : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                  error: errorPass
                      ? Row(
                          children: [
                            Icon(Icons.error_outline, color: AppTheme.errorColor),
                            SizedBox(width: 5),
                            Text(
                              AppConstants.lgInvalidPassTxt,
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: AppTheme.errorColor),
                            ),
                          ],
                        )
                      : null,
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: remind,
                    onChanged: (bool? newValue) {
                      setState(() {
                        remind = !remind;
                      });
                    },
                    checkColor: Color(0xFFffffff),
                    activeColor: Color(0xFF1877F2),
                  ),
                  Text(
                    AppConstants.lgRememberTxt,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetScreen(),));
                    },
                    child: Text(
                      AppConstants.forgotPasswordTxt,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              CustomLoginButton(
                buttonTitle: AppConstants.lgLoginTxt,
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CounterScreen(),));
                },
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  AppConstants.lgContinueWithTxt,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomGoogleButton(
                    buttonTitle: AppConstants.lgFacebookTxt,
                    onPressed: () {
                    },
                    imgPath: CustomImagesPath.lgFacebookImage,
                  ),
                  CustomGoogleButton(
                    buttonTitle: AppConstants.lgGoogleTxt,
                    onPressed: () {
                    },
                    imgPath: CustomImagesPath.lgGoogleImage,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConstants.lgHaveNoAccTxt,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),));
                    }, child: Text(AppConstants.lgSignUpTxt,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: AppTheme.primaryColor),))
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
