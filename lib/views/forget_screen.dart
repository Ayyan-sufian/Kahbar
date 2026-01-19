import 'package:flutter/material.dart';
import 'package:kabar/helpers/constants.dart';
import 'package:kabar/views/verfication_screen.dart';
import 'package:kabar/views/widgets/custom_login_button.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: isPortrait ? size.height - 60 : size.height * 0.9,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      SizedBox(height: 16),
                      Text(
                        AppConstants.forgotPasswordTxt,
                        style: Theme.of(context).textTheme.headlineLarge,
                        maxLines: 2,
                      ),
                      SizedBox(height: 5),
                      Text(
                        AppConstants.forgotPasswordContentTxt,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 16),
                      Text(
                        AppConstants.fPEmailTxt,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(height: 4),
                      TextField(controller: emailController),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: size.height * 0.1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0xff000000).withAlpha(5),
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: CustomLoginButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VerificationScreen(
                                email: emailController.text.trim(),
                              ),
                            ),
                          );
                        },
                        buttonTitle: AppConstants.fPSubmitTxt,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
