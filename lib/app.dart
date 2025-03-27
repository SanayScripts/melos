import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melos/features/authentication/data/firebase_auth_repo.dart';
import 'package:melos/features/authentication/domain/repos/auth_repo.dart';
import 'package:melos/features/authentication/presentation/cubits/auth_cubit.dart';
import 'package:melos/features/authentication/presentation/cubits/auth_states.dart';
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
  final authRepo = FirebaseAuthRepo();
  MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    //provide cubit to the app
   return BlocProvider(create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: BlocConsumer<AuthCubit, AuthStates>(
        builder: (context, AuthStates){

          // unauthenticated -> auth page login/register
          if(AuthStates is Unauthenticated){
            return const AuthPage();
          }

          // authenticatedd -> home page
          if(AuthStates is Authenticated){
            return const HomePage();
          }

          // loading
          else{
            return const Scaffold(
              body: Center(child: CircularProgressIndicator(),
              ),
            );
          }
        }, 


        listener: (context, state) {
          
        },
        ),
    ),
  ); 
   
  }
}