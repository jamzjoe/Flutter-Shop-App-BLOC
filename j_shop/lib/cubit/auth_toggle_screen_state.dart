part of 'auth_toggle_screen_cubit.dart';

@immutable
class AuthToggleScreenState extends Equatable {
  bool? toggle;
  AuthToggleScreenState({required this.toggle});

  @override
  List<Object?> get props => [toggle];
}
