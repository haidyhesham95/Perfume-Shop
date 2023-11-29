part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginError extends LoginState {}
class ShowPasswordInLogin extends LoginState {}
class LoginGoogle extends LoginState {}

