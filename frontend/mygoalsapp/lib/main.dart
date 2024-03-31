import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mygoalsapp/src/features/auth/auth/auth_bloc.dart';
import 'package:mygoalsapp/src/features/auth/login/presenter/pages/login_page.dart';
import 'package:mygoalsapp/src/features/home/presenter/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/features/auth/auth/auth_state.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  final authBloc = await verifyIsLogged();
  runApp(
    MyApp(authBloc: authBloc),
  );
}

Future<AuthBloc> verifyIsLogged() async {
  final AuthBloc authBloc;
  final prefs = await SharedPreferences.getInstance();
  final isLogged = prefs.getString("userId")?.isNotEmpty ?? false;
  if (isLogged) {
    authBloc = AuthBloc(
      AuthenticationStateStatus(
        status: AuthenticationStatusEnum.authenticated,
      ),
    );
  } else {
    authBloc = AuthBloc(
      AuthenticationStateStatus(
        status: AuthenticationStatusEnum.unauthenticated,
      ),
    );
  }
  return authBloc;
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.authBloc,
  });

  final AuthBloc authBloc;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => authBloc,
        ),
      ],
      child: MaterialApp(
        title: 'MyGoals',
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff29E0A9),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xff29E0A9),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthBloc, IAuthState>(
          bloc: authBloc,
          builder: (context, state) {
            return state.status == AuthenticationStatusEnum.authenticated
                ? const HomePage()
                : LoginPage();
          },
        ),
      ),
    );
  }
}
