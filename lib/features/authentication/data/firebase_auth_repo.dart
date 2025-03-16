import 'package:firebase_auth/firebase_auth.dart';
import 'package:melos/features/authentication/domain/entities/app_user.dart';
import 'package:melos/features/authentication/domain/repos/auth_repo.dart';

class FirebaseAuthRepo implements AuthRepo{
  
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<AppUser?> loginWithEmailAndPassword(
      String email, String password) async {
    try{
      //attempt sign in 
      UserCredential userCredential = await firebaseAuth
      .signInWithEmailAndPassword(email: email, password: password);

      //create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid, 
        email: email, 
        name: '',
      );

      //return user
      return user;
    }
    catch(e){
      throw Exception("Login Failed $e");
    }
  }

  @override
  Future<AppUser?> registerWithEmailAndPassword(
      String name, String email, String password) async {
    try{
      //attempt sign up 
      UserCredential userCredential = await firebaseAuth
      .createUserWithEmailAndPassword(email: email, password: password);

      //create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid, 
        email: email, 
        name: name,
      );

      //return user
      return user;
    }
    catch(e){
      throw Exception("Login Failed $e");
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    //get current user logged in from firebase
    final firebaseUser = firebaseAuth.currentUser;
    
    // if user is not logged in return null
    if(firebaseUser == null){
      return null;
    }

    //user exists
    return AppUser(
      uid: firebaseUser.uid, 
      email: firebaseUser.email!, 
      name: '',
    );
  }
}