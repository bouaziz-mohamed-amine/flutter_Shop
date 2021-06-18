import 'dart:core';

import 'package:shop_app/order/BaseOrder.dart';
import 'package:shop_app/order/Order_Controller.dart';
import 'package:shop_app/product/BaseProduct.dart';
import 'package:shop_app/product/Product_Controller.dart';
import 'package:shop_app/user/Address.dart';
import 'package:shop_app/user/User.dart';

class Customer extends User {
  List<BaseOrder> orders;

  List<BaseProduct> watchList;

  Address shippingAddress;
  Address billingAddress;

  Customer(
    String id,
    String firstName,
    String lastName,
    String email,
    String phone,
    String gender,
    Address shippingAddress,
    Address billingAddress,
    List<BaseOrder> orders,
    List<BaseProduct> watchList,
  ) : super(id, firstName, lastName, email, phone, gender) {
    this.shippingAddress = shippingAddress;
    this.billingAddress = billingAddress;
    this.orders = orders;
    this.watchList = watchList;
  }

  Customer.fromJson(Map<String, dynamic> jsonObject)
      : super(
      jsonObject['id'],
      jsonObject['first_name'],
      jsonObject['last_name'],
      jsonObject['email'],
      jsonObject['phone'],
      jsonObject['gender'] ) {
    this.shippingAddress = Address.fromJson(jsonObject['shipping_address']);
    this.billingAddress = Address.fromJson(jsonObject['billing_address']);
    this.watchList = ProductController.toProducts(jsonObject['watch_list']);
    this.orders = OrderController.toOrders(jsonObject['orders']);
  }
}
