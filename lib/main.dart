import 'package:flutter/material.dart';
import 'package:melos/app.dart';
import 'package:melos/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  //firebase setup
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  //run app
  runApp(MyApp());
}

