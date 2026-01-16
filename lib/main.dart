import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kabar/model_view/article_view_model.dart';
import 'package:kabar/model_view/theme_provider.dart';
import 'package:kabar/views/home_page.dart';
import 'package:kabar/views/splash_screen.dart';
import 'package:kabar/views/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'model_view/articles_bloc.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        // ChangeNotifierProvider(create: (_) => ArticleViewModel()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ArticlesBloc(),
          ),
        ],
      child: const MyApp(),
    ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Kabar',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: SplashScreen(),
      ),
    );
  }
}
