import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:test_stajrofka/model/location_model.dart';
import 'package:test_stajrofka/service/dio_service/dio.dart';

part 'add_post_event.dart';
part 'add_post_state.dart';

class AddPostBloc extends Bloc<AddPostEvent, AddPostState> {
  static final dioService =  DioNetwork(Dio(BaseOptions(contentType: "application/json"),), baseUrl: ApiRepository.baseUrl);

  AddPostBloc() : super(AddPostInitialState()) {
    on<CreatePostEvent>(addPost);
  }

  void addPost( CreatePostEvent event,Emitter<AddPostState> emit) async {
    emit(AddPostLoadingState());
    try{
      bool response = await AddPostBloc.dioService.postAdd(postAdd: event.model);
      debugPrint("Data => $response");
      if(response){
        emit(CreatePostState());
      }else{
        emit(FailureState());
      }
    }catch(e){
      debugPrint("Error auth Bloc =>$e");
      emit(FailureState());
    }
  }
}
