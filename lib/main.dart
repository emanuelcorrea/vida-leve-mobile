import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vidaleve/pages/CreateUser/CreateUserPage.dart';
import 'package:vidaleve/pages/ForgotPassword/ForgotPasswordPage.dart';
import 'package:vidaleve/pages/Home/HomePage.dart';
import 'package:vidaleve/pages/Layout/Layout.dart';
import 'package:vidaleve/pages/Login/LoginPage.dart';
import 'package:vidaleve/pages/Patient/PatientPage.dart';
import 'package:vidaleve/pages/PatientAnamneses/PatientAnamnesesPage.dart';
import 'package:vidaleve/pages/PatientDetails/PatientDetailsPage.dart';
import 'package:vidaleve/pages/PatientList/PatientListPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Vida Leve',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Layout();
            } else {
              return const LoginPage();
            }
          },
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/home': (context) => const HomePage(),
          '/layout': (context) => const Layout(),
          '/login': (context) => const LoginPage(),
          '/create-user': (context) => const CreateUserPage(),
          '/forgot-password': (context) => const ForgotPasswordPage(),
          '/patient': (context) => const PatientPage(),
          '/patient-anamneses': (context) => const PatientAnamnesesPage(),
          '/patient-details': (context) => const PatientDetailsPage(),
          '/patient-list': (context) => const PatientListPage(),
        });
  }
}
