import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Paint {
  final int id;
  final String title;
  final Color colorpicture;

  Paint(this.id, this.title, this.colorpicture);
}

class _MyHomePageState extends State<MyHomePage> {
  List<Paint> paints = <Paint>[
    Paint(1, 'Red', Colors.red),
    Paint(2, 'Blue', Colors.blue),
    Paint(3, 'Green', Colors.green),
    Paint(4, 'Lime', Colors.lime),
    Paint(5, 'Indigo', Colors.indigo),
    Paint(6, 'Yellow', Colors.yellow),
    Paint(7, 'Black', Colors.black),
    Paint(8, 'Brown', Colors.brown),
    Paint(9, 'Amber', Colors.amber),
    Paint(10, 'Cyan', Colors.cyan),
    Paint(11, 'Lime', Colors.lime),
  ];

  void _updateMyItems(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final Paint item = paints.removeAt(oldIndex);
    paints.insert(newIndex, item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReOrderable ListView in Flutter'),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: ReorderableListView(
        children: List.generate(paints.length, (index) {
          return ListTile(
            key: ValueKey('value$index'),
            leading: Container(
              width: 100.0,
              height: 100.0,
              color: paints[index].colorpicture,
            ),
            title: Text('ID : ' + paints[index].id.toString(),style: TextStyle(fontWeight:FontWeight.bold),),
            subtitle: Text(paints[index].title),
          );
        }),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            _updateMyItems(oldIndex, newIndex);
          });
        },
      ),
    );
  }
}
