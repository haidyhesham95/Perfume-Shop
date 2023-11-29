part of 'Theme_cubit.dart';

@immutable



// Events
abstract class ThemeEvent {}

class ToggleTheme extends ThemeEvent {}

// States
class ThemeState {
  final ThemeData themeData;

  ThemeState(this.themeData);
}