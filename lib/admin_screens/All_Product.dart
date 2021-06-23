


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/admin_screens/add_product.dart';

class AllProducts extends StatefulWidget {
  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder:(context){
                        return AddProduct();
                    } ));
              },
              icon: Icon(Icons.ice_skating),)
        ],
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
                trailing: IconButton(
                    color: Colors.red,
                    onPressed: (){
                     // print(streamSnapshot.data.docs[index].id);
                      FirebaseFirestore.instance.collection('products').doc(streamSnapshot.data.docs[index].id).delete() ;
                    },
                    icon: Icon(Icons.delete)
                ),
    )
    );
    },
    ),
    );
  }

}
