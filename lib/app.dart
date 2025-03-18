import 'package:flutter/material.dart';
import 'package:melos/features/authentication/data/firebase_auth_repo.dart';
import 'package:melos/features/authentication/domain/repos/auth_repo.dart';
import 'package:melos/features/authentication/presentation/pages/auth_page.dart';
import 'package:melos/themes/light_mode.dart';

/*
  Root Layer of the app
---------------------------------
  Repositories for database
   - Firebase
  
  Blocs for state management
   - AuthBloc
   - profile
    - posts
  
  Chech Auth State
    -unauthenticatedd -> AuthPage
    -authenticated -> HomePage
*/

class MyApp extends StatelessWidget {

  //Auth Repo
  final AuthRepo = FirebaseAuthRepo();
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const AuthPage(),
   );
  }
}