import 'package:e_commerce_app/Pages/home/view/home_page.dart';
import 'package:e_commerce_app/Setting/Theme_cubit.dart';
import 'package:e_commerce_app/Pages/layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Constant/helper.dart';
import 'Pages/cart/model/cart_provider.dart';
import 'Pages/auth/view/Login/login_page.dart';
import 'Pages/auth/view/register/register_page.dart';
import 'Pages/details/view/details_page.dart';
import 'Pages/favorite/model/favorite_provider.dart';
import 'Pages/home/Product/product_provider.dart';
import 'Pages/recently/model/viewed_prod_provider.dart';
import 'Pages/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('************** User is currently signed out!');
      } else {
        print('***************** User is signed in!');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (context) => ThemeCubit(),
        ),
        ChangeNotifierProvider(create: (_)=>ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider(),),
        ChangeNotifierProvider(create: (_) => FavoriteProvider(),),
        ChangeNotifierProvider(create: (_) => ViewedProdProvider(),),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
               home:FirebaseAuth.instance.currentUser == null ? const SplachScreen(): const LayoutScreen(),
              routes: {
                'login': (context) => LoginPage(),
                "register":(context)=> RegisterPage(),
                "layout":(context)=>const LayoutScreen(),
                "home":(context)=>const HomePage(),
                "details":(context)=>const DetailsPage(),
              },
            );
          }),
    );
  }
}
