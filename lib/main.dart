import 'package:flutter/material.dart';
import 'package:medicationhero/constants/routes.dart';
import 'package:medicationhero/services/auth/auth_service.dart';
import 'package:medicationhero/views/Register_view.dart';
import 'package:medicationhero/views/login_view.dart';
import 'package:medicationhero/views/notes/medicationhero_view.dart';
import 'package:medicationhero/views/notes/create_update_medication_view.dart';
import 'package:medicationhero/views/verifyemail_view.dart';

//we need a dedicated homepage stateless widget
//this widget needs to do the initialization
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 226, 66, 17)),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        //lets define 2 routes here
        loginRoute: (context) => const LoginView(),
        registerRoute: (context) => const RegisterView(),
        medicationheroRoute: (context) => const MedicationHeroView(),
        verifyEmailRoute: (context) => const VerifyEmailView(),
        createOrUpdateMedicationRoute: (context) =>
            const CreateUpdateMedicationView(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const MedicationHeroView();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
