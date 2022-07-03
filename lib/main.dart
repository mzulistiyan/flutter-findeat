import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_findeat/cubit/auth_cubit.dart';
import 'package:flutter_application_findeat/cubit/page_cubit.dart';
import 'package:flutter_application_findeat/ui/pages/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transition;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: transition.Transition.cupertino,
        home: SplashScreenPage(),
      ),
    );
  }
}
