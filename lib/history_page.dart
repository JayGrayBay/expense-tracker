import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> recentItems = ['Item 1', 'Item 2', 'Item 3']; // Assume this is your list of recent items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: ListView.builder(
        itemCount: recentItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recentItems[index]),
          );
        },
      ),
    );
  }
}
