import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_shop/bloc/bloc/auth_bloc.dart';
import 'package:j_shop/screens/Home.dart';
import 'package:j_shop/screens/auth/AuthWrapper.dart';
import 'package:j_shop/screens/ui/Loading.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is LoginSuccess) {
        return Home(token: state.token,);
      }
      return const AuthWrapper();
    });
  }
}
