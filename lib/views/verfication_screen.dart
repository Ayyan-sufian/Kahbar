import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kabar/views/congratulations_screen.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:kabar/views/widgets/CustomLoginButtom.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../helpers/constants.dart';
import '../model_view/theme_provider.dart';

class VerificationScreen extends StatefulWidget {
  final String email;

  const VerificationScreen({super.key, required this.email});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen>
    with SingleTickerProviderStateMixin {
  final int countdownSeconds = 60;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  late AnimationController _controller;

  bool inputFull = false;

  int get remaining =>
      (countdownSeconds * (1 - _controller.value)).ceil();


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: countdownSeconds),
    )..addListener(() {
      if (!mounted) return;
      setState(() {});
    });

    _controller.forward();
  }


  @override
  void dispose() {
    _controller.dispose();
    otpController.dispose();
    super.dispose();
  }

  bool isCorrect = false;

  void passCorrect() {
    isCorrect = true;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
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
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16),
                        Text(
                          AppConstants.vsOtpTxt,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(
                                color: themeProvider.isDark(context)
                                    ? Colors.white
                                    : Colors.black,
                              ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          AppConstants.vsContentTxt + widget.email,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 30),
                        Form(
                          key: formKey,
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: Pinput(
                              onCompleted: (value) {
                                setState(() {
                                  inputFull = true;
                                  print("Hello $inputFull");
                                });
                              },
                              onChanged: (value) {
                                setState(() {
                                  inputFull = false;
                                });
                              },
                              validator: (s) {
                                return s == '2222' ? null : 'Pin is incorrect';
                              },
                              keyboardType: TextInputType.number,
                              controller: otpController,
                              errorPinTheme: PinTheme(
                                width: 64,
                                height: 64,
                                textStyle: Theme.of(
                                  context,
                                ).textTheme.headlineMedium,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFF3F8),
                                  borderRadius: BorderRadiusGeometry.circular(
                                    6,
                                  ),
                                  border: Border.all(
                                    color: AppTheme.errorColor,
                                  ),
                                ),
                              ),
                              errorText: AppConstants.lgInvalidPassTxt,
                              errorTextStyle: TextStyle(
                                color: AppTheme.errorColor,
                              ),
                              defaultPinTheme: PinTheme(
                                height: 64,
                                width: 64,
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(color: Color(0xFF050505)),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.white,
                                  borderRadius: BorderRadiusGeometry.circular(
                                    6,
                                  ),
                                  border: Border.all(
                                    color: themeProvider.isDark(context)
                                        ? Color(0xFFB0B3B8)
                                        : Color(0xFF4E4B66),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppConstants.vsResendCodeTxt,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              remaining > 0
                                  ? '$remaining s'
                                  : AppConstants.vsResendTxt,
                              style: TextStyle(color: AppTheme.errorColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                inputFull == true
                    ? Container(
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
                                final isValid = formKey.currentState!
                                    .validate();
                                isValid
                                    ? Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CongratulationsScreen(),
                                        ),
                                      )
                                    : null;
                              },
                              buttonTitle: AppConstants.fPSubmitTxt,
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
