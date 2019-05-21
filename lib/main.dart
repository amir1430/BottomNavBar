import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<MaterialAccentColor> accentts = <MaterialAccentColor>[
    Colors.cyanAccent,
    Colors.deepPurpleAccent,
    Colors.pinkAccent
  ];

  var _selected = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      ' Home',
      style: optionStyle,
    ),
    Text(
      ' Business',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: accentts.elementAt(_selected + 1),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: accentts.elementAt(_selected),
        primary: false,
      ),
      body: Container(
        child: Center(
          child: _widgetOptions.elementAt(_selected),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.cyanAccent,
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.business),
            title: Text('business'),
          ),
        ],
        currentIndex: _selected,
        onTap: _onItemTapped,
        fixedColor: accentts.elementAt(_selected),
      ),
    );
  }
}
