import 'package:e_commerce_app/Constant/Colors.dart';
import 'package:e_commerce_app/Constant/Styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import '../../widget/account_signup.dart';
import '../../widget/visibility_icon.dart';
import '../../widget/widget formfield.dart';
import '../../widget/custom_button.dart';
import '../../widget/forget_button.dart';
import '../../widget/google_button.dart';
import '../../manager/login/login_cubit.dart';

class LoginPage extends StatelessWidget {
   const LoginPage({super.key});

 @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginCubit(),
      child:BlocBuilder<LoginCubit,LoginState>(
        builder: (context,state){
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: Stack(
              children: [
                Image.asset('assets/images/background.jpg',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Center(
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Form(
                       key:cubit.loginKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Sign In',style: Styles.textStyle35,),
                            const Text('Welcome back to perfume shop',
                              style: TextStyle(fontSize: 20,fontFamily: 'Courgette'),),
                            const SizedBox(height: 30,),

                             WidgetFormField(
                               validator: (validator){
                                 if(validator ==""){
                                   return('Please enter your email');

                                 }
                                 return null;
                               },
                              controller: cubit.email,
                              hintText: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              prefixIcon: const Icon(IconlyLight.message,color: kColor,),
                              obscureText: false,
                            ),
                            const SizedBox(height: 15,),
                             WidgetFormField(
                               validator: (validator){
                                 if(validator ==""){
                                   return('Please enter your password');

                                 }
                                 return null;
                               },
                               controller:cubit. password,
                              hintText: 'Password',
                              keyboardType:TextInputType.visiblePassword ,
                              textInputAction: TextInputAction.done,
                               obscureText: cubit.isShowLoginPassword,
                              prefixIcon: const Icon(Icons.lock_outline,color: kColor,),
                               suffixIcon: VisibilityIcon(
                               onTap: (){cubit.changeLoginPasswordVisibility();},
                               visible:  !cubit.isShowLoginPassword,),

                            ),
                            const ForgetButton(),
                            const SizedBox(height: 50,),
                            Column(
                              children: [
                                CustomButton(
                                    data: 'Sign In',
                                    onPressed:
                                        ()async{
                                     if(cubit.loginKey.currentState!.validate()){
                                       cubit.signInWithEmailAndPassword(
                                         cubit.email.text,cubit.password.text,context,
                                       );

                                     }
                                     }

                                ),
                                const SizedBox(height: 10,),
                                GoogleButton(
                                  onPressed: ()  {
                                    BlocProvider.of<LoginCubit>(context).signInWithGoogle().then((value) {
                                      Navigator.of(context).pushReplacementNamed("layout");

                                    },);


                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const AccountSignUp(),
                          ],
                        ),
                      ),
                    ),
                  ),
                )


              ],

            ),
          );

        },
      )

    );
  }
}
