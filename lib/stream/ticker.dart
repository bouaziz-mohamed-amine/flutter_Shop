 import 'dart:async';

class TickerController{


   final StreamController<int> _tickerController = StreamController<int>();
    Stream<int> get tickerStream =>_tickerController.stream ;
    StreamSink<int> get tickerSink => _tickerController.sink ;


   final StreamController<int> _incrementController=StreamController<int>();
    StreamSink<int> increment (){
      return _incrementController.sink ;
    }

   final StreamController<int> _decrementController=StreamController<int>();
    StreamSink<int> decrement ( ){
      return _decrementController.sink ;
    }

    TickerController(){
      int ticker=4;
      _tickerController.add(ticker);
      _incrementController.stream.listen(_incrementCount);
      _decrementController.stream.listen(_decrementCount);
    }

   void _incrementCount(int count){
      count++;
      tickerSink.add(count);
   }
   void _decrementCount(int count){
      count-- ;
      tickerSink.add(count);
   }
   void dispose(){
      _decrementController.close();
      _incrementController.close();
      _tickerController.close();
   }
}