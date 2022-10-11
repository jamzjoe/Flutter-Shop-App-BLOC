part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {


  @override
  List<Object?> get props => [];
}

class VerifyingUser extends AuthState {
}

class UserVerified extends AuthState {
  final String token;

  UserVerified(this.token);
  @override
  List<Object?> get props => [token];
}

class LoginError extends AuthState{
  final String error;

  LoginError(this.error);
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends AuthState{
  final String token;

  LoginSuccess(this.token);
  @override
  List<Object?> get props => [token];
}