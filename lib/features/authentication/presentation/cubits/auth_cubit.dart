/* 

Auth Cubit: State Mgmt

*/ 

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melos/features/authentication/domain/entities/app_user.dart';
import 'package:melos/features/authentication/domain/repos/auth_repo.dart';
import 'package:melos/features/authentication/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) :super (AuthInitial());

  // check if user is already authenticated
  void checkAuth() async {
    final AppUser? user = await authRepo.getCurrentUser();

    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
    
  }


  // get current user
  AppUser? get currentUser => _currentUser;

  // login with email and password
  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailAndPassword(email, password);

      if(user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit (AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }

  // register with email and password
  Future<void> register(String name, String email, String password) async {
        try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailAndPassword(name, email, password);

      if(user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit (AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }
  
  // logout
  Future<void> logout() async {
    authRepo.logout();
    emit(Unauthenticated());
  }
}