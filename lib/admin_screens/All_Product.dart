
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Products'),
        centerTitle: true,
      ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder: (context, streamSnapshot) {
            return ListView.builder(
              itemCount: streamSnapshot.data.docs.length,
              itemBuilder: (ctx, index) =>
                  ListTile(
                    title: Text(streamSnapshot.data.docs[index]['product_title']),
                    subtitle: Text(streamSnapshot.data.docs[index]['product_description']),
                  )
            );
          },
        ));
  }

}
