part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();

}

class InitialEvent extends AuthEvent{

  @override
  List<Object?> get props => [];
}

class Logout extends AuthEvent {

  @override
  List<Object?> get props => [];
}
class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  @override
  List<Object?> get props => [];
  const LoginEvent(this.email, this.password);
}