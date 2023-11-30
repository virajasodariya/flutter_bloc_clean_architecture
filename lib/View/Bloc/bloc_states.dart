import 'package:flutter_bloc_clean_architecture/Api/api_response.dart';

abstract class BlocProductState {}

class BlocStateWrapper<T> extends BlocProductState {
  final ApiResponse<T> apiResponse;
  BlocStateWrapper(this.apiResponse);
}
