import 'package:flutter/material.dart';
import 'package:melos/features/authentication/presentation/pages/login_page.dart';
import 'package:melos/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:melos/themes/light_mode.dart';

void main() async{
  //firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  //run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: LoginPage(),
   );
  }
}