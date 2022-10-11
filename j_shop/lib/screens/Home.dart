import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:j_shop/bloc/bloc/auth_bloc.dart';
import 'package:j_shop/repository/auth/AuthRepository.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.token),
            TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(Logout());
                },
                child: const Text('Logout')),
          ],
        ),
      ),
    );
  }
}
