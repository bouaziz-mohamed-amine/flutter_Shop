


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
        title: Text('All Products'),
        centerTitle: true,
      ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          // ignore: missing_return
          builder: (context, streamSnapshot) {
            switch(streamSnapshot.connectionState){
              case ConnectionState.none:
                return _loading();
                break;
              case ConnectionState.waiting:
                return _loading();
                break;
              case ConnectionState.active:
                return ListView.builder(
                    itemCount: streamSnapshot.data.docs.length,
                    itemBuilder: (ctx, index) =>
                        ListTile(
                          title: Text(streamSnapshot.data.docs[index]['product_title'],style: TextStyle(fontSize: 25),),
                          subtitle: Text(streamSnapshot.data.docs[index]['product_description'],style: TextStyle(fontSize: 18),),
                          trailing: IconButton(
                              color: Colors.red,
                              onPressed: (){
                                FirebaseFirestore.instance.collection('products').doc(streamSnapshot.data.docs[index].id).delete() ;
                              },
                              icon: Icon(Icons.delete)
                          ),
                        )
                );
                break;

            }
    },
    ),
    );
  }
  Widget _loading(){
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: CircularProgressIndicator()
        )
    );
  }
}
