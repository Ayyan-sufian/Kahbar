import 'package:flutter/material.dart';
import 'package:kabar/model_view/theme_provider.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:kabar/views/widgets/CustomGoogleButton.dart';
import 'package:kabar/views/widgets/CustomLoginButtom.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

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
    final themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text("Hello", style: Theme.of(context).textTheme.headlineLarge),
            Text(
              "Again!",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(color: Color(0xff1877F2)),
            ),
            SizedBox(height: 10),
            Text(
              "Welcome back you’ve\nbeen missed",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 52),
            Text("Username*", style: Theme.of(context).textTheme.bodySmall),
            TextField(
              decoration: InputDecoration(
                helper: errorUser
                    ? Row(
                        children: [
                          Icon(Icons.error_outline, color: AppTheme.errorColor),
                          SizedBox(width: 5),
                          Text(
                            "Invalid username",
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: AppTheme.errorColor),
                          ),
                        ],
                      )
                    : null,
              ),
            ),
            SizedBox(height: 16),
            Text("Password*", style: Theme.of(context).textTheme.bodySmall),
            TextField(
              obscureText: isVisible,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
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
                            "Invalid password",
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
                  "Remember me",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Spacer(),
                TextButton(
                  onPressed: () {}, // add navigation here
                  child: Text(
                    "Forget Password ?",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppTheme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomLoginButton(
              buttonTitle: 'Login',
              onPressed: () {
                print("ayan login button pressed");
              },
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                "Or continue with",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomGoogleButton(
                  themeProvider: themeProvider,
                  buttonTitle: 'FaceBook',
                  onPressed: () {
                    print("ayan facebook button pressed");
                  },
                  imgPath: 'facebook.svg',
                ),
                CustomGoogleButton(
                  themeProvider: themeProvider,
                  buttonTitle: 'Google',
                  onPressed: () {
                    print("ayan facebook button pressed");
                  },
                  imgPath: 'google.svg',
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account ?",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall
                  ),
                  TextButton(onPressed: (){}, child: Text("Sign up",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: AppTheme.primaryColor),))
                ],
              ),
          ],
        ),
      ),
    );
  }
}
