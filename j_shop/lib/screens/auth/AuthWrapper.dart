import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_shop/bloc/bloc/auth_bloc.dart';
import 'package:j_shop/cubit/auth_toggle_screen_cubit.dart';
import 'package:j_shop/screens/auth/Login.dart';
import 'package:j_shop/screens/auth/Register.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

bool _toggle = true;

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red, content: Text(state.error.toString())));
        }
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Successfully Login')));
        }
      },
      child: Scaffold(
        body: BlocBuilder<AuthToggleScreenCubit, AuthToggleScreenState>(
          builder: (context, state) {
      if (state.toggle == true) {
      return const Register();
      } else {
      return const Login();
      }
      }),

      ),
    );
  }

  Future<void> switchScreen() async {
    setState(() {
      _toggle = !_toggle;
    });
  }
}
