import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:j_shop/bloc/bloc/auth_bloc.dart';
import 'package:j_shop/cubit/auth_toggle_screen_cubit.dart';
import 'package:j_shop/repository/auth/AuthRepository.dart';
import 'package:j_shop/screens/Home.dart';
import 'package:j_shop/screens/Wrapper.dart';

void main() {
  runApp(MyApp(
    authRepository: AuthRepository(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.authRepository}) : super(key: key);
  final AuthRepository authRepository;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) =>
              AuthBloc(authRepository),
        ),
        BlocProvider<AuthToggleScreenCubit>(
          create: (context) => AuthToggleScreenCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const Wrapper(),
          '/home': (context) => const Home(
                token: '',
              )
        },
      ),
    );
  }
}
