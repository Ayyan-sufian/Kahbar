import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              "Hello",
              style: Theme.of(context).textTheme.headlineLarge,
              textAlign: TextAlign.start,
            ),
            Text(
              "Again!",
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.copyWith(color: Color(0xff1877F2)),
              textAlign: TextAlign.start,
            ),
            Text(
              "Welcome back you’ve been missed",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 48),
            TextField(
              decoration: InputDecoration(
                helperText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Color(0XFF4E4B66)),
                ),
              ),
            ),
            SizedBox(height: 16),
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
                helperText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: BorderSide(color: Color(0XFF4E4B66)),
                ),
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
