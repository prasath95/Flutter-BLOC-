import 'package:api_bloc/bloc/blocOne.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final blocOne=BlocOne();

  @override
  void dispose() {
    /*
    * inorder to prevent memory leak wwe have to call dispose method
    * this is our custom dispose in blocOne class
    * */
    blocOne.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: blocOne.counterStream,
              builder: (context,snapshot) {
                return Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{
          blocOne.eventSink.add(counterAction.Increment)
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
