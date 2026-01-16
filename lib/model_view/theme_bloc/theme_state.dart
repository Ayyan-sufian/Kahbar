part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeModeState extends ThemeState {
  final ThemeMode themeMode;

  ThemeModeState({required this.themeMode});
}
