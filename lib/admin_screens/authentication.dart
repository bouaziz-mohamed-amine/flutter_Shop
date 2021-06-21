import 'package:flutter/material.dart';
import 'package:shop_app/authentication/firebase_auth.dart';

class FlutterShop extends StatefulWidget {
  @override
  _FlutterShopState createState() => _FlutterShopState();
}

class _FlutterShopState extends State<FlutterShop> {

  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  FireBaseAuthentication  auth = FireBaseAuthentication();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth.getCurrentUser();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Flutter Shop'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image(
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              image: AssetImage('assets/images/auth.jpg')
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(right: 16,left: 16),
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.6,
              decoration: BoxDecoration(
                color:  Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(25) ,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('LogIn',style: TextStyle(fontSize: 25),),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "email",
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: _passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "password",

                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  MaterialButton(
                    color: Colors.grey.shade400,
                    child: Text('LogIn',style: TextStyle(fontSize: 20,color: Colors.white),),
                    onPressed: ()  async{
                      String email = _emailcontroller.text;
                      String password= _passwordcontroller.text;
                      print(email);
                      print(password);

                      var user = auth.sigIn( email, password);
                      if(user != null){
                        print("goo");
                      }else {
                        print('laaa');
                      }
                    },
                  ),
                  MaterialButton(
                      color: Colors.grey.shade400,
                      child: Text('SignOut',style: TextStyle(fontSize: 20,color: Colors.white),),
                      onPressed: (){
                        auth.signOut();
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


