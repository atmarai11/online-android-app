import 'package:techno_gadgets/response/cart_response.dart';

import '../api/cart_api.dart';

class CartRepository {
  Future<bool?> addToCart(int quantity, String productId) async {
    return CartAPI().addToCart(quantity, productId);
  }

  Future<CartResponse?> getCart() async {
    return CartAPI().getCart();
  }

  Future<bool?> deleteCart(String cartId) async {
    return CartAPI().deleteCart(cartId);
  }
}
