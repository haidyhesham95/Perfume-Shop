import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Constant/Colors.dart';
import '../../../../Constant/model/user_model.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController userName = TextEditingController();
  GlobalKey<FormState> formRegister = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();

  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

 // sign up

  Future<void> createUserWithEmailAndPassword(String email, String password, context,UserModel  userModel,) async {
    try {
      var value = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String uid = value.user!.uid;

      await FirebaseFirestore.instance.collection("users").doc(uid).set(userModel.toMap(id: uid));
     emit(RegisterSuccess());

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Email Created Successfully'),
        backgroundColor: kColor,
      ));

      Navigator.of(context).pushReplacementNamed("layout");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterError());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('The password provided is too weak.'),
          backgroundColor: kColor,
        ));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterError());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('The account already exists for that email.'),
          backgroundColor: kColor,
        ));
      }
    } catch (e) {
      emit(RegisterError());
    }
  }


 //pickImage


  Future<void> localImagePicker() async {
    final XFile? pickedImageCamera = await _picker.pickImage(source: ImageSource.camera);
    emit(PickedImageState(pickedImageCamera));
    emit(CameraEvent());

    final XFile? pickedImageGallery = await _picker.pickImage(source: ImageSource.gallery);
    emit(PickedImageState(pickedImageGallery));
    emit(GalleryEvent());

    emit(PickedImageState(null)); // Reset state to NoImageState
    emit(RemoveEvent());
  }





// visibility
  bool isShowRegisterPassword = true;

  void changeRegisterPasswordVisibility() {
    isShowRegisterPassword = !isShowRegisterPassword;
    emit(ShowPasswordInRegister());
  }

  bool isRepeatPasswordInRegister= true;

  void changeRepeatRegisterPasswordVisibility() {
    isShowRegisterPassword = !isShowRegisterPassword;
    emit(ShowRepeatPasswordInRegister());
  }



}
