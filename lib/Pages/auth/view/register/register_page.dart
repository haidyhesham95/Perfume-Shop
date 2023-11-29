import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Constant/Colors.dart';
import 'package:e_commerce_app/Constant/Styles.dart';
import 'package:e_commerce_app/Pages/auth/manager/register/register_cubit.dart';
import 'package:e_commerce_app/Pages/auth/widget/visibility_icon.dart';
import 'package:e_commerce_app/Services/my_app_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../Constant/model/user_model.dart';
import '../../widget/widget formfield.dart';
import '../../widget/pick_image.dart';
import '../../widget/custom_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  XFile? _pickedImage;

Future<void>localImagePicker()async{
  final ImagePicker picker =ImagePicker();
  await MyAppMethod.imagePickerDialog(
      context: context,
      cameraFCT: () async{
       _pickedImage = await picker.pickImage(source: ImageSource.camera);
       setState(() {

       });
      },
      galleryFCT: ()  async{
        _pickedImage = await picker.pickImage(source: ImageSource.gallery);
        setState(() {

        });
      },
      removeFCT: () {
        setState(() {
          _pickedImage = null;
        });
      }
  );
}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          RegisterCubit cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/background.jpg',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sign up',
                            style: Styles.textStyle35,
                          ),
                          const Text(
                            'We are glad you will join us 😊',
                            style: TextStyle(
                                fontSize: 20, fontFamily: 'Courgette'),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Form(
                            key: cubit.formRegister,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: size.width * 0.3,
                                  width: size.width * 0.3,
                                  child: PickImage(
                                    pickedImage:_pickedImage,
                                    function: () async {
                                      await localImagePicker();

                                    },

                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                WidgetFormField(
                                  validator: (validator) {
                                    if (validator == "") {
                                      return ('Please enter your name');
                                    }
                                    return null;
                                  },
                                  controller:cubit. userName,
                                  hintText: 'Name',
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  prefixIcon: const Icon(
                                    IconlyLight.profile,
                                    color: kColor,
                                  ),
                                  obscureText: false,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                WidgetFormField(
                                  validator: (validator) {
                                    if (validator == "") {
                                      return ('@gmail.com');
                                    }
                                    return null;
                                  },
                                  controller:cubit. email,
                                  hintText: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  prefixIcon: const Icon(
                                    IconlyLight.message,
                                    color: kColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                WidgetFormField(
                                  validator: (validator) {
                                    if (validator == "") {
                                      return ('Please enter your password');
                                    }
                                    return null;
                                  },
                                  controller:cubit. password,
                                  hintText: 'Password',
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done,
                                  obscureText: cubit.isShowRegisterPassword,
                                  prefixIcon: const Icon(
                                    Icons.lock_outline,
                                    color: kColor,
                                  ),
                                  suffixIcon: VisibilityIcon(
                                    onTap: () {  cubit.changeRegisterPasswordVisibility();},
                                    visible: !cubit.isShowRegisterPassword ,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomButton(
                              onPressed: () async {
                                if (cubit.formRegister.currentState!.validate()) {
                                  cubit.createUserWithEmailAndPassword(cubit.email.text, cubit.password.text,context,
                                      UserModel(
                                          userName: cubit.userName.text,
                                          userImage: "",
                                          userEmail: cubit.email.text.toLowerCase(),
                                          userCart: [],
                                          userWish: [],
                                          createdAt: Timestamp.now(),
                                      )   );

                                }
                              },
                              data: 'Sign UP',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
