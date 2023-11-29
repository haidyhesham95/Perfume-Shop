part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}
class RegisterError extends RegisterState {}
class CameraEvent extends RegisterState {}
class GalleryEvent extends RegisterState {}
class RemoveEvent extends RegisterState {}
class PickedImageState extends RegisterState {
  final XFile? pickedImage;

  PickedImageState(this.pickedImage);
}

class ShowPasswordInRegister extends RegisterState {}
class ShowRepeatPasswordInRegister extends RegisterState {}
