import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const secondPageRoute = "/something/something-else";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: (settings) {
        print("[ROUTE] ${settings.name}");
        var builder;
        if (settings.name == '/') {
          builder = (_) => MyHomePage(title: 'Flutter Demo Home Page');
        } else if (settings.name == secondPageRoute) {
          builder = (_) => SecondPage();
        }

        if (builder == null) {
          return MaterialPageRoute(builder : (_) => Container(), settings: settings);
        }

        return MaterialPageRoute(builder : builder, settings: settings);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navigate() {
    setState(() {
      Navigator.of(context).pushNamed(secondPageRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Initial Page',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigate,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Text("Page 2"),
    );
  }
}
