import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_shop/bloc/bloc/auth_bloc.dart';
import 'package:j_shop/cubit/auth_toggle_screen_cubit.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
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
              decoration: const InputDecoration(
                  label: Text('Username'),
                  hintText: 'Your name',
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text('Password'),
                  hintText: 'Password',
                  border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () {

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
    );
  }
}
