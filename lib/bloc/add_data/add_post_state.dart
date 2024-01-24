part of 'add_post_bloc.dart';

abstract class AddPostState extends Equatable {
  const AddPostState();
  @override
  List<Object> get props => [];
}

class AddPostInitialState extends AddPostState {}

class AddPostLoadingState extends AddPostState {}

class FailureState extends AddPostState {}

class CreatePostState extends AddPostState {}



