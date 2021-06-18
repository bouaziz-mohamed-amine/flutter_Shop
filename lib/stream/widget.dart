import 'package:flutter/material.dart';
import 'package:shop_app/stream/ticker.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

   TickerController tickerController=TickerController();
   @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tickerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('StreamExample'),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: tickerController.tickerStream,
          // ignore: missing_return
          builder: ( context,snapshot){

            if(snapshot.hasError){
              return Text('Error');
            }else
            if(!snapshot.hasData){
                return Text('Error');
            }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(snapshot.data.toString(),style: TextStyle(fontSize: 28),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MaterialButton(
                            child: Icon(Icons.remove),
                            color: Colors.grey.shade200,
                            onPressed: (){
                                tickerController.decrement().add(snapshot.data);
                            }),
                        MaterialButton(
                            child: Icon(Icons.add),
                            color: Colors.grey.shade200,
                            onPressed: (){
                              tickerController.increment().add(snapshot.data);
                            }),
                      ],
                    )
                  ],
                ),
              )     ;
          }
      ),
    );
  }
}



