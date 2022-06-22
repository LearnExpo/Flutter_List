import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_/a.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int myList = 20;

  ScrollController _scrollController = ScrollController();
  int _currentMax = 10;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      //print(_scrollController.position);
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
        print(_getMoreData());
      }
    });
  }

  _getMoreData() {
    myList += 20;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List_Long"),
      ),
      body: ListView.builder(
        itemCount: myList,
        controller: _scrollController,
        itemExtent: 60,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: (index % 2 == 0) ? Colors.white : Colors.green,
            child: ListTile(
              leading: const Icon(Icons.list),
              trailing: const Icon(Icons.live_tv_rounded),
              title: Text("$index"),
            ),
          );
        },
      ),
    );
  }
}
