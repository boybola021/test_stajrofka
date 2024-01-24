import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_stajrofka/model/user_model.dart';
import 'package:test_stajrofka/service/dio_service/dio.dart';
import 'package:test_stajrofka/service/string.dart';

import '../../screen/intial_page.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

 static final dioService =  DioNetwork(Dio(BaseOptions(contentType: "application/json"),), baseUrl: ApiRepository.baseUrl);

  AuthBloc() : super(AuthInitialState()) {
    on<AuthSignUpEvent>(signUp);
  }


 void signUp(AuthSignUpEvent event,Emitter<AuthState> emit,) async {
   try{
     emit(AuthLoadingState());
    final res = await dioService.postSignUp(event.userModel);
     if(res.message.isNotEmpty){
       emit(const AuthSuccessfulState(message: KTString.successful));
     }else{
       emit(AuthFailureState());
     }
   }catch(e){
     debugPrint("Error auth Bloc =>$e");
     emit(AuthFailureState());
   }
 }
}
