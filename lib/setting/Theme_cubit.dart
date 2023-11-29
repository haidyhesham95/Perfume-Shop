import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'Theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(_lightTheme));

  static final ThemeData _lightTheme = ThemeData.light();
  static final ThemeData _darkTheme = ThemeData.dark();

  void toggleTheme() {
    final newTheme = state.themeData == _lightTheme ? _darkTheme : _lightTheme;
    emit(ThemeState(newTheme));
  }
}





