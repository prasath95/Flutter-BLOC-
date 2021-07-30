import 'dart:async';

enum counterAction{
  Increment,
  Decrement,
  Reset
}

class BlocOne{

  late int counter;

  /*
  * this is our second pipe to translate event to state
  * */
  final _stateStreamController = StreamController<int>();

  StreamSink<int> get counterSink => _stateStreamController.sink;

  Stream<int> get counterStream => _stateStreamController.stream;


  /*
  * this is first pipe to listen event to listen user action
  * */
  final _eventStreamController = StreamController<counterAction>();

  StreamSink<counterAction> get eventSink => _eventStreamController.sink;

  Stream<counterAction> get eventStream => _eventStreamController.stream;


  /*
  * constructor
  * */
  BlocOne(){

     counter=0;

   eventStream.listen((event) {
     if(event==counterAction.Increment)
       {
          counter++;
       }
     else if(event==counterAction.Decrement)
       {
         counter--;
       }
     else if(event==counterAction.Reset)
       {
         counter=0;
       }

     counterSink.add(counter);

   });

  }

  void dispose()
  {
    _stateStreamController.close();
    _eventStreamController.close();
  }

}

