import 'package:flutter/material.dart';
import 'package:kabar/model_view/theme_provider.dart';
import 'package:kabar/views/splash_screen.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (_) => ThemeProvider(),child: const MyApp(),));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    final ThemeProvider theme = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Kabar',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreen()
    );
  }
}
