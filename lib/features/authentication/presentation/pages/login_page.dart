/*

LOGIN PAGE

Here an existing yser can login with their email and password.

Once they successfully login, they will be redirected to the home page.

And if they don't have an account, they can navigate to the registration page.

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melos/features/authentication/presentation/components/my_button.dart';
import 'package:melos/features/authentication/presentation/components/my_textfield.dart';
import 'package:melos/features/authentication/presentation/cubits/auth_cubit.dart';

class LoginPage extends StatefulWidget {
  final void Function()? togglePages;

  const LoginPage({super.key, required this.togglePages,});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //login function
  void login(){
    //prepare email and password
    final String email = emailController.text;
    final String password = passwordController.text;

    //auth cubit
    final authCubit = context.read<AuthCubit>();

    // ensure that email and password are not empty
    if (email.isNotEmpty && password.isNotEmpty){
      //login
      authCubit.login(email, password);
    } else {
      //show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter both email and password"),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
 
  //BUILD UI
  @override
  Widget build(BuildContext context) {

    //SCAFFOLD
    return Scaffold(

      //BODY
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(
                Icons.lock_open_rounded, //placeholder logo until we have a real one
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
            
              const SizedBox(height: 50),
              //welcome back mshg
              Text(
                "Welcome back, you've been missed!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
                
              ),
            
              const SizedBox(height: 25),
            
              //email textfield
              MyTextfield(
                controller: emailController,
                hintText: "Email", 
                obscureText: false,
                ),
                
              const SizedBox(height: 25),
              //password textfield
              MyTextfield(
                controller: emailController,
                hintText: "Password", 
                obscureText: true,
                ),

              const SizedBox(height: 25.0),

              //login button
              MyButton(
                onTap: () {},
                text: "Login",
              ),

              const SizedBox(height: 25.0),


              //register now page ko jaane ka button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: 
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),

                  GestureDetector(
                    onTap: widget.togglePages, 
                    child: Text(
                      " Register now",
                      style: 
                      TextStyle(color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
            ),
          ),
        ),
      ),
    );
  }
}