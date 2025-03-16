/*

LOGIN PAGE

Here an existing yser can login with their email and password.

Once they successfully login, they will be redirected to the home page.

And if they don't have an account, they can navigate to the registration page.

*/

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //BUILD UI
  @override
  Widget build(BuildContext context) {

    //SCAFFOLD
    return Scaffold(

      //BODY
      body: SafeArea(
        child: Center(
          child: Column(children: [
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
            
            //password textfield

            //login button

            //register now page ko jaane ka button
          ],),
        ),
      ),
    );
  }
}