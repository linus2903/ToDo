import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo4/screens/karte_hinzufuegen.dart';
import 'package:todo4/todo_karte.dart';
import '../constance.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'To-Do-Liste'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List getCardData = CardData.cardList;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void addCard() {
    setState(() {});
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
              width: 350.0,
            ),
            // Container(
            //   height: containerheigt,
            //   width: containerwidth,
            //   child: Card(
            //     color: Colors.white,
            //     margin: EdgeInsets.symmetric(
            //       vertical: 14.0,
            //       horizontal: 28.0,
            //     ),
            //     elevation: 7.0,
            //     child: Text(
            //       'test Karte',
            //       style: TextStyle(
            //         fontSize: 40.0,
            //         fontFamily: 'Source Sans Pro',
            //         color: Colors.teal[900],
            //       ),
            //     ),
            //   ),
            // ),
            Container(
              height: containerheigt,
              width: containerwidth,
              child: Todo_karte(
                colour: Colors.black12,
                cardChild: Row(
                  children: <Widget>[
                    Text('MOIN'),
                  ],
                ),
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Karte_bearbeiten_state(),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: getCardData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: containerheigt,
                      width: containerwidth,
                      child: Todo_karte(
                        colour: (getCardData[index])['color'],
                        cardChild: Row(
                          children: <Widget>[
                            Text((getCardData[index])['text']),
                          ],
                        ),
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Karte_bearbeiten_state(),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      //(getCardData[index])['text']
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('This is the Drawer'),
              ElevatedButton(
                onPressed: _closeDrawer,
                child: Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KarteHinzufuegen()),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
