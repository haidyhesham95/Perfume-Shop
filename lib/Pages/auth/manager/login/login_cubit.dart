
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../Constant/Colors.dart';
part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  TextEditingController password =TextEditingController();
  TextEditingController email =TextEditingController();
  GlobalKey<FormState>loginKey = GlobalKey<FormState>();

  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

   // sign in

  Future signInWithEmailAndPassword(String email,String password,context)async{
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      emit(LoginSuccess());

      Navigator.of(context).pushReplacementNamed("layout");
    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginError());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No user found for that email.'),
          backgroundColor: kColor,
        ));
      } else if (e.code == 'wrong-password') {
        emit(LoginError());
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Wrong password provided for that user.'),
          backgroundColor: kColor,
        ));
      }
    } catch (e) {
      emit(LoginError());
    }
  }

// visibility
  bool isShowLoginPassword = true;

  void changeLoginPasswordVisibility() {
    isShowLoginPassword = !isShowLoginPassword;
    emit(ShowPasswordInLogin());
  }



  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
          final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      if (authResult.additionalUserInfo!.isNewUser) {
        await FirebaseFirestore.instance.collection("users").doc(user!.uid).set({
          'userId': user.uid,
          'userName': user.displayName,
          'userImage': user.photoURL,
          'userEmail': user.email,
          'createdAt': Timestamp.now(),
          'userWish': [],
          'userCart': [],
        });
        print("New user created");
      }

      emit(LoginGoogle());
    } catch (e, stackTrace) {
      print("Error during Google sign-in: $e\n$stackTrace");
    }
  }

}
