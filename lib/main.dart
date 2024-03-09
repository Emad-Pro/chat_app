import 'package:chat_app/core/firebase_options.dart';
import 'package:chat_app/core/theme/theme.dart';
import 'package:chat_app/feture/home/presentation/viewModel/cubit/home_cubit.dart';
import 'package:chat_app/feture/mainViewBody.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          create: (context) => HomeCubit(),
        ),
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        theme: ThemeService().lightMode,
        darkTheme: ThemeService().darkMode,
        themeMode: ThemeMode.light,
        home: const HomeViewBody(),
      ),
    );
  }
}
