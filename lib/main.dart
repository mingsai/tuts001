import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Building Screens',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Impact',
      ),
      home: MyHomePage(title: 'San Amigos'),
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
  int _counter = 0;
  final googleTextStyle = GoogleFonts.aclonica(
    textStyle: TextStyle(
      color: Color(0xffffaa00),
      fontSize: 40,
      fontWeight: FontWeight.bold,
      fontFamilyFallback: [
        'ComicSansMS',
        'MarkerFelt',
        'Impact',
      ],
    ),
  );
  final macTextStyle = TextStyle(
    color: Colors.blueGrey,
    fontFamily: 'Impact',
    fontSize: 15,
  );
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'MarkerFelt',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                    textAlign: TextAlign.center,
                    style: (Theme.of(context).platform == TargetPlatform.macOS)
                        ? macTextStyle
                        : googleTextStyle,
                  ),
                  SizedBox(
                    child: Container(
                      color: Colors.lightGreen,
                    ),
                    height: 4,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.display3.merge(
                          TextStyle(
                            color: Colors.deepPurpleAccent,
                            fontSize: 60,
                          ),
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.green,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Colors.red,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(
                    color: Colors
                        .yellow))), // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              title: Text("Menu"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
            )
          ],
        ),
      ),
      extendBody: true,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 15.0,
            ),
          ],
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            5.0,
            5.0,
            5.0,
            5.0,
          ),
          child: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.home),
            isExtended: true,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
