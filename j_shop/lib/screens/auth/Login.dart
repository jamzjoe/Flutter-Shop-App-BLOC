import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_shop/bloc/bloc/auth_bloc.dart';
import 'package:j_shop/cubit/auth_toggle_screen_cubit.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

final _emailController = TextEditingController();
final _passwordController = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {

      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    label: Text('Username'),
                    hintText: 'Your name',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    label: Text('Password'),
                    hintText: 'Password',
                    border: OutlineInputBorder()),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(LoginEvent(
                        _emailController.text.toString().trim(),
                        _passwordController.text.trim().toString()));
                  },
                  child: const Text('Login')),
              TextButton(
                  onPressed: () {
                    BlocProvider.of<AuthToggleScreenCubit>(context)
                        .toggleScreen();
                  },
                  child: const Text('Already have an account?')),
            ],
          )),
        )),
      ),
    );
  }
}
