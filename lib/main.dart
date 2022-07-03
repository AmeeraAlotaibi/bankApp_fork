import 'package:bank_app/Pages/home_page.dart';
import 'package:bank_app/Pages/signin_page.dart';
import 'package:bank_app/Pages/transfer.dart';
import 'package:bank_app/Pages/welcome_page.dart';
import 'package:bank_app/Pages/withdraw_page.dart';
import 'package:bank_app/pages/edit_profile.dart';
import 'package:bank_app/pages/transactions.dart';
import 'package:bank_app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'Pages/deposit.dart';
import 'Pages/profile_page.dart';
import 'Pages/signup_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,

      // theme data
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color(0xFF7b4cf5),
            ),
      ),
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => WelcomePage()),
    GoRoute(path: '/home-page', builder: (context, state) => HomePage()),
    GoRoute(path: '/signup', builder: (context, state) => SignupPage()),
    GoRoute(path: '/signin', builder: (context, state) => SigninPage()),
    GoRoute(path: '/test-page', builder: (context, state) => WelcomePage()),
    GoRoute(path: '/welcome-page', builder: (context, state) => WelcomePage()),
    GoRoute(path: '/profile-page', builder: (context, state) => ProfilePage()),
    GoRoute(path: '/deposit-page', builder: (context, state) => DepositPage()),
    GoRoute(
        path: '/withdraw-page', builder: (context, state) => WithdrawPage()),
    GoRoute(
        path: '/transfer-page', builder: (context, state) => TransferPage()),
    GoRoute(
        path: '/transactions', builder: (context, state) => TransactionsPage()),
    GoRoute(path: '/edit-profile', builder: (context, state) => EditProfile()),
  ]);
}
