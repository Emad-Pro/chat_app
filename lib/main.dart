import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/feture/auth/login/presintation/view/loginScreen.dart';
import 'package:chat_app/feture/auth/login/presintation/viewModel/cubit/login_cubit.dart';
import 'package:chat_app/feture/auth/sinUp/presintation/viewModel/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        theme: ThemeService().lightMode,
        darkTheme: ThemeService().darkMode,
        themeMode: ThemeMode.dark,
        home: LoginScreen(),
      ),
    );
  }
}
