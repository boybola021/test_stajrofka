part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthFailureState extends AuthState {}

class AuthSuccessfulState extends AuthState{
  final String message;
  const AuthSuccessfulState({required this.message});
}

class AuthSignUpState extends AuthState{}

class AuthSignInState extends AuthState{}