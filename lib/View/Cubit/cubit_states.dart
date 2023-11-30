import 'package:flutter_bloc_clean_architecture/Model/post_response_model.dart';

abstract class CubitPostState {}

class CubitPostInitial extends CubitPostState {}

class CubitPostLoading extends CubitPostState {}

class CubitPostLoaded extends CubitPostState {
  final List<PostResponseModel> posts;
  CubitPostLoaded(this.posts);
}

class CubitPostError extends CubitPostState {
  final String errorMessage;
  CubitPostError(this.errorMessage);
}
