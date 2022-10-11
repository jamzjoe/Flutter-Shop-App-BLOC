import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_toggle_screen_state.dart';

class AuthToggleScreenCubit extends Cubit<AuthToggleScreenState> {
  AuthToggleScreenCubit() : super(AuthToggleScreenState(toggle: false));

  void toggleScreen() => emit(AuthToggleScreenState(toggle: !state.toggle!));
}
