import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/admin_screens/All_Product.dart';
import 'package:shop_app/authentication/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'admin_screens/add_product.dart';
import 'admin_screens/authentication.dart';

 Future<void> main()  async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(RunApp());
}
class RunApp  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home:  AddProduct(),
    );
  }
}

