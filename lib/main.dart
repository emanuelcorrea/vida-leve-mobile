import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vidaleve/model/Patient.dart';
import 'package:vidaleve/model/user.dart';
import 'package:vidaleve/pages/CreateUser/CreateUserPage.dart';
import 'package:vidaleve/pages/ForgotPassword/ForgotPasswordPage.dart';
import 'package:vidaleve/pages/ForgotPasswordConfirm/ForgotPasswordConfirmPage.dart';
import 'package:vidaleve/pages/Home/HomePage.dart';
import 'package:vidaleve/pages/Login/LoginPage.dart';
import 'package:vidaleve/pages/Patient/PatientPage.dart';
import 'package:vidaleve/pages/PatientAnamneses/PatientAnamnesesPage.dart';
import 'package:vidaleve/pages/PatientDetails/PatientDetailsPage.dart';
import 'package:vidaleve/pages/PatientList/PatientListPage.dart';
import 'package:vidaleve/providers/auth_provider.dart';
import 'package:vidaleve/providers/settings_provider.dart';
import 'package:vidaleve/providers/user_provider.dart';
import 'package:vidaleve/widgets/CustomStaffold/CustomScaffold.dart';
import 'package:vidaleve/widgets/LoginScaffold/CustomScaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider()),
    ],
    child: MyApp(),
  ));
}

final navigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  MyApp({super.key});
  final settinsProvider = SettingsProvider();
  
  late final GoRouter _router = GoRouter(
    refreshListenable: settinsProvider,
    initialLocation: '/auth',
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return LoginScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/auth',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: LoginPage(),
            ),
            routes: <RouteBase>[
              GoRoute(
                  path: 'forgot-password',
                  builder: (BuildContext context, GoRouterState state) {
                    return const ForgotPasswordPage();
                  },
                  routes: [
                    GoRoute(
                      path: 'confirmation',
                      builder: (BuildContext context, GoRouterState state) =>
                          const ForgotPasswordConfirmPage(),
                    )
                  ],
                ),
                GoRoute(
                  path: 'create',
                  builder: (BuildContext context, GoRouterState state) {
                    return const CreateUserPage();
                  },
                ),
            ],
          ),
        ],
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return CustomScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: '/calendar',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: '/profile',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: '/patient',
            name: 'patient',
            builder: (BuildContext context, GoRouterState state) {
              final Patient patient = state.extra as Patient;

              return PatientPage(
                patient: patient,
              );
            },
            routes: [
              GoRoute(
                path: 'list',
                builder: (BuildContext context, GoRouterState state) {
                  return const PatientListPage();
                },
              ),
              GoRoute(
                path: 'anamneses',
                builder: (BuildContext context, GoRouterState state) {
                  final Patient patient = state.extra as Patient;

                  return PatientAnamnesesPage(
                    patient: patient,
                  );
                },
              ),
              GoRoute(
                path: 'details',
                builder: (BuildContext context, GoRouterState state) {
                  final Patient patient = state.extra as Patient;
                  
                  return PatientDetailsPage(patient: patient);
                },
              )
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final isLogoutLocation = state.location == '/logout';

      dynamic user = 
        Provider.of<SettingsProvider>(context, listen: false).user;

      final isLogged = !(user == null || user == '');


      if (!state.location.startsWith('/auth') && !isLogged) {
        return '/auth';
      }

      if (isLogoutLocation) {
        Provider.of<SettingsProvider>(context, listen: false).setUser('');

        return '/auth';
      }
    
      return null;
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Vida Leve',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
