import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/Api/app_exception.dart';
import 'package:flutter_bloc_clean_architecture/Model/post_response_model.dart';
import 'package:flutter_bloc_clean_architecture/Repo/post_repo.dart';
import 'package:flutter_bloc_clean_architecture/View/Cubit/cubit_states.dart';

class PostCubit extends Cubit<CubitPostState> {
  PostCubit() : super(CubitPostInitial());

  Future<void> fetchPosts() async {
    try {
      emit(CubitPostLoading());

      List<PostResponseModel> responseModel = await PostRepo.getPost();

      emit(CubitPostLoaded(responseModel));
    } catch (error) {
      log('Error fetching posts: $error');

      emit(CubitPostError(error.toString()));
    }
  }
}
