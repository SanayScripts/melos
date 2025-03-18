import 'package:flutter/material.dart';
import 'package:melos/features/authentication/presentation/components/my_button.dart';
import 'package:melos/features/authentication/presentation/components/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;

  const RegisterPage({super.key, required this.togglePages,});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
 //text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
 
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
              // create acc message
              Text(
                "Join Melos, find your tune",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
                
              ),
            
              const SizedBox(height: 25),
            
                MyTextfield(
                controller: nameController,
                hintText: "Name", 
                obscureText: false,
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
                controller: passwordController,
                hintText: "Password", 
                obscureText: true,
                ),

              const SizedBox(height: 25),

              //confirm password textfield
              MyTextfield(
                controller: confirmPasswordController,
                hintText: "Confirm Password", 
                obscureText: true,
                ),
              const SizedBox(height: 25.0),

              // Register Button
              MyButton(
                onTap: () {},
                text: "Register",
              ),

              const SizedBox(height: 25.0),


              //login now page ko jaane ka button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a member?",
                    style: 
                    TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),

                  GestureDetector(
                    onTap: widget.togglePages, 
                    child: Text(
                      " Login now",
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