import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Shop'),
          centerTitle: true,
        ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
                child: Text('all_products'),
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/products');
                }),
            MaterialButton(
                child: Text('add_product'),
                onPressed: (){
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, '/add_product');
                }),

          ],
        ),
      ),
    );
  }
}
