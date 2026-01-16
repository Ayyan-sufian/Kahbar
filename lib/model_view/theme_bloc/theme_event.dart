part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class SetSystemEvent extends ThemeEvent{}
class DarkModeEvent extends ThemeEvent{}
class LightModeEvent extends ThemeEvent{}
