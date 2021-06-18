import 'package:shop_app/product/BaseProduct.dart';

class ProductController {

  BaseProduct product ;

  ProductController(this.product);

  static List<BaseProduct> toProducts(List<Map<String,dynamic>>jsonObject) {}

}