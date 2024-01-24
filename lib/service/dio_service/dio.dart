import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:retrofit/http.dart';
import 'package:test_stajrofka/bloc/auth/auth_bloc.dart';
import 'package:test_stajrofka/model/location_model.dart';
import 'package:test_stajrofka/model/user_model.dart';

import '../../model/response_model.dart';
part 'dio.g.dart';


sealed class ApiRepository{
 static const String baseUrl = "https://qutb.uz/api";
 static const String signUp = "/auth/register";
 static const String signIn = "/auth/login";
 static const String addPost = "/ads";
}

@RestApi(baseUrl:ApiRepository.baseUrl)
abstract class DioNetwork{
  factory DioNetwork(Dio dio,{String baseUrl}) = _DioNetwork;

  @POST(ApiRepository.signUp)
  Future<DataResponse>postSignUp(@Body() UserModel userModel);

  @POST(ApiRepository.addPost)
  Future<bool>postAdd({required LocationModel postAdd});
}
