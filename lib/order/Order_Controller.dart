import 'package:shop_app/order/BaseOrder.dart';

class OrderController {

  BaseOrder order ;

  OrderController(this.order);

  static List<BaseOrder> toOrders(List<Map<String,dynamic>>jsonObject){}

}