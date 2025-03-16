/*
 Auth repo to outline all possible auth operations for this stupid app
 */

import 'package:melos/features/authentication/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailAndPassword(String email, String password);
  Future<AppUser?> registerWithEmailAndPassword(
    String name, String email, String password);
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
}