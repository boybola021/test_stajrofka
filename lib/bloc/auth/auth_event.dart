part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object?> get props => [];
}

class AuthSignUpEvent extends AuthEvent{
  final UserModel userModel;
   const AuthSignUpEvent( {required  this.userModel});
  @override
  List<Object?> get props => [userModel];
}

class AuthSignInEvent extends AuthEvent{
  final String name;
  final String password;
  const AuthSignInEvent({required this.name,required this.password});
  @override
  List<Object?> get props => [name,password];
}
