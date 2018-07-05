import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic stuff',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation =
        new CurvedAnimation(parent: _controller, curve: Curves.bounceInOut)
          ..addListener(() => setState(() {}))
          ..addStatusListener((AnimationStatus animationStatus) {
            print(animationStatus);
          });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _showSnackBar('You have tapped menu icon');
          },
        ),
        title: Text('Sample App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              _showSnackBar('You have tapped on search icon');
            },
          ),
        ],
      ),
      body: Center(
        child: FlutterLogo(
          size: _animation.value * 80.0,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Love'),
        onPressed: () {
          _showSnackBar('You have Tapped FAB');
        },
        icon: Icon(Icons.favorite),
      ),
      bottomNavigationBar: BottomAppBar(
        hasNotch: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              onPressed: () {
                // TODO:
              },
              icon: Icon(Icons.account_circle),
            ),
            IconButton(
              onPressed: () {
                // TODO:
              },
              icon: Icon(Icons.dashboard),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showSnackBar(String s) {
    final snackBar = SnackBar(
      content: Text(s),
      duration: Duration(seconds: 2),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
