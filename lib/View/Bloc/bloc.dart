import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/Api/api_response.dart';
import 'package:flutter_bloc_clean_architecture/Model/product_response_model.dart';
import 'package:flutter_bloc_clean_architecture/Repo/product_repo.dart';
import 'package:flutter_bloc_clean_architecture/View/Bloc/bloc_events.dart';
import 'package:flutter_bloc_clean_architecture/View/Bloc/bloc_states.dart';

class ProductBloc extends Bloc<BlocProductEvent, BlocProductState> {
  ProductBloc() : super(BlocStateWrapper(ApiResponse.initial())) {
    on<BlocProductFetch>((event, emit) => fetchData(emit));
  }

  Future<void> fetchData(Emitter<BlocProductState> emit) async {
    {
      try {
        emit(BlocStateWrapper(ApiResponse.loading()));

        ProductResponseModel responseModel = await ProductRepo.getProduct();

        emit(BlocStateWrapper(ApiResponse.complete(responseModel)));
      } catch (error) {
        log('Error fetching posts: $error');

        emit(BlocStateWrapper(ApiResponse.error(message: error.toString())));
      }
    }
  }
}
