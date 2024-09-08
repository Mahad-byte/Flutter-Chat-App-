import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  Color buttonColor;  //Widget variable

  CounterStateful({super.key,required this.buttonColor});

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

class _CounterStatefulState extends State<CounterStateful> {
  int counter = 0;  //State variable

  void increment(){
    if(mounted) {
      setState(() {
        counter++;
      });
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "$counter",
        style: TextStyle(fontSize: 24),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
        onPressed: () {
          increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
