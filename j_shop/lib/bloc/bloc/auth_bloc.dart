import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:j_shop/repository/auth/AuthRepository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository) : super(VerifyingUser()) {


    on<Logout>((event, emit) {
      emit(LoginError("Error"));
    });

    on<LoginEvent>((event, emit) async{
      emit(VerifyingUser());
      try{
        await _authRepository.login(event.email, event
            .password);
        emit(LoginSuccess(_authRepository.token));
      }catch(e){
        emit(LoginError("Login error!. Please check your user credentials!."));
      }
    });
  }
}
