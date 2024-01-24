part of 'add_post_bloc.dart';

abstract class AddPostEvent extends Equatable {
  const AddPostEvent();
}

class CreatePostEvent extends AddPostEvent{
  final LocationModel model;
  const CreatePostEvent({required this.model});
  @override
  List<Object?> get props => [model];
}
