class BaseUrlPost {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
}

class BaseUrlProduct {
  static const String baseUrl = "https://dummyjson.com";
}

class EndPoints {
  /// posts
  static const String posts = "${BaseUrlPost.baseUrl}/posts";

  /// products
  static const String products = "${BaseUrlProduct.baseUrl}/products";
}
