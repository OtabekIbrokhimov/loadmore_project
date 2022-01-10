import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: 'Contact'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int get count => list.length;

  List<int> list = [1];
  List <Color> colors = Colors.accents;
  List contacts = ["Otabek", "Ziyo", "Anvar", "Fayoz","Abdulaziz","Chingiz","Ravshan","Otabek", "Ziyo", "Anvar","Fayoz","Abdulaziz","Chingiz", "Ravshan","Otabek", "Ziyo", "Anvar", "Fayoz","Abdulaziz","Chingiz","Ravshan","Otabek", "Ziyo", "Anvar","Fayoz","Abdulaziz","Chingiz", "Ravshan","Otabek", "Ziyo", "Anvar", "Fayoz","Abdulaziz","Chingiz","Ravshan","Otabek", "Ziyo", "Anvar","Fayoz","Abdulaziz","Chingiz", "Ravshan","Otabek", "Ziyo", "Anvar", "Fayoz","Abdulaziz","Chingiz","Ravshan","Otabek", "Ziyo", "Anvar","Fayoz","Abdulaziz","Chingiz", "Ravshan" ];
  List numbers = ["+998937239333", "+998939646663", "+998943530036", "+998939994779","+998939994905","+998934144111", "+998945301375","+998937239333", "+998939646663", "+998943530036", "+998939994779","+998939994905","+998934144111", "+998945301375", "+998937239333", "+998939646663", "+998943530036", "+998939994779","+998939994905","+998934144111", "+998945301375","+998937239333", "+998939646663", "+998943530036", "+998939994779","+998939994905","+998934144111", "+998945301375","+998937239333", "+998939646663", "+998943530036", "+998939994779","+998939994905","+998934144111", "+998945301375","+998937239333", "+998939646663", "+998943530036", "+998939994779","+998939994905","+998934144111", "+998945301375", "+998937239333", "+998939646663", "+998943530036", "+998939994779","+998939994905","+998934144111", "+998945301375","+998937239333", "+998939646663", "+998943530036", "+998939994779","+998939994905","+998934144111", "+998945301375" ];
  void initState() {
    super.initState();
    // list.addAll(List.generate(30, (v) => v));
  }

  void load() {
    print("load");
    setState(() {
      list.addAll(List.generate(15, (v) => v));
      print("data count = ${list.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: Container(
        child: RefreshIndicator(
          child: LoadMore(
            isFinish: count >= 30,
            onLoadMore: _loadMore,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                 Container(
                  child: Text(contacts[index].toString()),
                  alignment: Alignment.centerLeft,
                );
                return _itemlists(index);
              },
              itemCount: count,
            ),
            whenEmptyLoad: false,
            delegate: DefaultLoadMoreDelegate(),
            textBuilder: DefaultLoadMoreTextBuilder.english,
          ),
          onRefresh: _refresh,
        ),
      ),
    );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    list.clear();
    load();
  }

  Widget _itemlists(int index){
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundColor: colors[index%16],
          minRadius: 60,
          maxRadius: 60,
          child: Text(
            contacts.elementAt(index),
            style: const TextStyle(fontSize: 10, color: Colors.black),
          ),
        ),
        title: Text(contacts.elementAt(index),
          style: const TextStyle(fontSize: 18),
        ),
        subtitle: Text(numbers.elementAt(index)),
        trailing: IconButton(
          icon: Icon(
            Icons.phone,
            color: Colors.greenAccent,
            size: 30,
          ),
          onPressed: (){},
        ),
      ),
    );
  }

}
