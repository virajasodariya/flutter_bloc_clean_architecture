import 'package:flutter_bloc_clean_architecture/Api/api_handlers.dart';
import 'package:flutter_bloc_clean_architecture/Api/base_url.dart';
import 'package:flutter_bloc_clean_architecture/Model/product_response_model.dart';

class ProductRepo {
  static Future<ProductResponseModel> getProduct() async {
    String url = EndPoints.products;

    var response = await APIService().getResponse(
      url: url,
      apitype: APIType.aGet,
    );

    ProductResponseModel responseModel =
        ProductResponseModel.fromJson(response);

    return responseModel;
  }
}
