import 'package:medicationhero/services/auth/auth_provider.dart';
import 'package:medicationhero/services/auth/auth_user.dart';
import 'package:medicationhero/services/auth/firebase_auth_provider.dart';

//create the basic authservice class
class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);

//add firebase factory to auth service
  factory AuthService.firebase() => AuthService(
        FirebaseAuthProvider(),
      );

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser?> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize() => provider.initialize();
}
