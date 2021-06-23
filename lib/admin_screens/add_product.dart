import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false ;
  TextEditingController _productTitleController = TextEditingController();
  TextEditingController _productDescriptionController = TextEditingController();
  TextEditingController _productPriceController = TextEditingController();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _productDescriptionController.dispose();
    _productPriceController.dispose();
    _productTitleController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body:( isLoading )? _loading(): _form()  ,
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
Widget  _form() {
    return SingleChildScrollView(
      child: Container(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLines: 2,
                  controller: _productTitleController,
                  decoration: InputDecoration(
                    hintText: 'Product title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the title';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _productDescriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Product Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'description is required';
                    }
                    return null;
                  } ,
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _productPriceController,
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Product Price',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'price is required';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                MaterialButton(
                  color: Colors.teal,
                  child: Text('Add Product',style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    if(_formKey.currentState.validate()){
                      setState(() {
                        isLoading = true;
                      });
                      FirebaseFirestore.instance.collection('products').add({
                        'product_title': _productTitleController.text,
                        'product_description': _productDescriptionController.text,
                        'product_price': _productPriceController.text ,
                      }).then((value) {
                       setState(() {
                         isLoading = false ;
                       });
                       _productPriceController.text=' ';
                       _productDescriptionController.text=' ';
                       _productTitleController.text= '';
                      }
                      );
                    }
                  },

                )
              ],
            )
        ),
      ),
    );
}

}
