import 'dart:async';

import 'package:medicationhero/services/auth/auth_user.dart';

//abstract class
abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentUser;
  //need a login function
  Future<AuthUser?> logIn({
    required String email,
    required String password,
  }); //function to create a new user
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }); //function to logout a user
  Future<void> logOut();
  Future<void> sendEmailVerification();
}
