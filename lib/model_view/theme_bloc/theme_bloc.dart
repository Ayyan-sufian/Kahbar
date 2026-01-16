
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeModeState> {
  ThemeBloc() : super(ThemeModeState(themeMode: ThemeMode.system)) {
    on<SetSystemEvent>((event, emit) {
      emit(ThemeModeState(themeMode: ThemeMode.system));
    });

    on<DarkModeEvent>((event, emit) {
      emit(ThemeModeState(themeMode: ThemeMode.dark));
    });


    on<LightModeEvent>((event, emit) {
      emit(ThemeModeState(themeMode: ThemeMode.light));
    });
  }




}
