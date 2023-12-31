// ignore_for_file: unused_local_variable

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/State_Data.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
    create: (BuildContext context) => StateData(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('callback kullanımı'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: SolWidgetA()),
            Expanded(child: SagWidgetA())
          ],
        ),
      ),
    );
  }
}

class SolWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String sehir = Provider.of<StateData>(context).sehir;
    return Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Text(
              'Sol Widget',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              sehir,
              style: TextStyle(fontSize: 20),
            )
          ],
        ));
  }
}

class SagWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String text = Provider.of<StateData>(context).sehir;
    return Container(
      color: Colors.green,
      child: Column(children: [
        Text(
          'SagWidget A sehir = {$text}',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetB()
      ]),
    );
  }
}

class SagWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 180,
      color: Colors.purple,
      child: Column(children: [
        Text(
          'SagWidget B',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetC()
      ]),
    );
  }
}

class SagWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Function newCity = Provider.of<StateData>(context).newCity;
    return Container(
      color: Colors.white,
      height: 150,
      width: 160,
      child: Column(children: [
        Text(
          'SagWidget C',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Şehir: ... ',
          style: TextStyle(fontSize: 20),
        ),
        TextField(onChanged: (input) {
          newCity(input);
        }),
      ]),
    );
  }
}
