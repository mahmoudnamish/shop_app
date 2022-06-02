import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: Column(children:
    [
      Text('SearchScreen',style: TextStyle(fontSize: 25,
          fontWeight: FontWeight.bold) )

    ]),
    );
  }
}
