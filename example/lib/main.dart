import 'package:flutter/material.dart';
import 'package:breakpoint/breakpoint.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final _breakpoint = Breakpoint.fromConstraints(constraints);
      return Scaffold(
        appBar: AppBar(
          title: Text('Breakpoint Example: ${_breakpoint.toString()}'),
        ),
        body: Container(
          padding: EdgeInsets.all(_breakpoint.gutters),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _breakpoint.columns,
              crossAxisSpacing: _breakpoint.gutters,
              mainAxisSpacing: _breakpoint.gutters,
            ),
            itemCount: 200,
            itemBuilder: (_, index) {
              return Container(
                child: Card(
                  child: Text(
                    index.toString(),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
