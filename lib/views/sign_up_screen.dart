import 'package:flutter/material.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/model_view/theme_provider.dart';
import 'package:kabar/views/login_screen.dart';
import 'package:kabar/views/widgets/CustomLoginButtom.dart';
import 'package:provider/provider.dart';

import 'theme/app_theme.dart';
import 'widgets/CustomGoogleButton.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool remind = false;
  bool errorUser = false;
  bool errorPass = false;
  bool errorConfirmPass = false;
  bool isVisible = true;
  bool isConfirmVisible = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                AppConstants.suHelloTxt,
                style: Theme.of(
                  context,
                ).textTheme.headlineLarge!.copyWith(color: Color(0xff1877F2)),
              ),
              SizedBox(height: 10),
              Text(
                AppConstants.suContentTxt,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 52),
              Text(AppConstants.suNameTxt, style: Theme.of(context).textTheme.bodySmall),
              TextField(
                controller: nameController,
              ),
              SizedBox(height: 16),
              Text(AppConstants.fPEmailTxt, style: Theme.of(context).textTheme.bodySmall),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
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
                controller: passController,
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
              Text(AppConstants.suConfirmPassTxt, style: Theme.of(context).textTheme.bodySmall),
              TextField(
                controller: confirmPassController,
                obscureText: isConfirmVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmVisible ? Icons.visibility_off_outlined : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmVisible = !isConfirmVisible;
                      });
                    },
                  ),
                  error: errorConfirmPass
                      ? Row(
                    children: [
                      Icon(Icons.error_outline, color: AppTheme.errorColor),
                      SizedBox(width: 5),
                      Text(
                        "Password is not same",
                        style: Theme.of(context).textTheme.bodySmall!
                            .copyWith(color: AppTheme.errorColor),
                      ),
                    ],
                  )
                      : null,
                ),
              ),
              SizedBox(height: 8),
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

                ],
              ),
              SizedBox(height: 16),
              CustomLoginButton(
                buttonTitle: AppConstants.lgSignUpTxt,
                onPressed: () {
                  if(passController.text != confirmPassController.text){
                    setState(() {
                      errorConfirmPass = true;
                    });
                  }else{
                    setState(() {
                      errorConfirmPass = false;
                    });
                  }
                  print("ayan login button pressed");
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
                    themeProvider: themeProvider,
                    buttonTitle: AppConstants.lgFacebookTxt,
                    onPressed: () {
                      print("ayan facebook button pressed");
                    },
                    imgPath: CustomImagesPath.lgFacebookImage,
                  ),
                  CustomGoogleButton(
                    themeProvider: themeProvider,
                    buttonTitle: AppConstants.lgGoogleTxt,
                    onPressed: () {
                      print("ayan Google button pressed");
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
                      AppConstants.suAlreadyHaveAccTxt,
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                  }, child: Text(AppConstants.lgLoginTxt,
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
