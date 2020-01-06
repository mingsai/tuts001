import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuts001/views/mi_card.dart';
import 'package:tuts001/views/settings_screen.dart';

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
      fontStyle: FontStyle.italic,
    ),
  );
  final macTextStyle = TextStyle(
    color: Colors.purple[700],
    fontFamily: 'MarkerFelt',
    fontSize: 35,
    fontWeight: FontWeight.w700,
    fontFamilyFallback: [
      'ComicSansMS',
      'MarkerFelt',
      'Impact',
    ],
  );

  Widget _getMainFAB() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.star_border),
      isExtended: true,
    );
  }

  Widget _getColoredDivider({
    BuildContext context,
    double lineHeight = 4,
    double lineMargin = 0.0,
    Color lineColor = Colors.brown,
    double lineWidthFactor = 0,
  }) {
    return SizedBox(
        child: Container(
          color: lineColor,
        ),
        height: lineHeight,
        width: MediaQuery.of(context).size.width -
            (MediaQuery.of(context).size.width * lineWidthFactor)
//      width: MediaQuery.of(context).size.width - lineMargin,
        );
  }

  Widget _getDefaultBody() {
    return Center(
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
                _getColoredDivider(
                    context: context,
                    lineColor: Colors.pink[600],
                    lineWidthFactor: 0.2), //better than using the linemargin?
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display3.merge(
                        TextStyle(
                          color: Colors.deepOrange[900],
                          fontSize: 60,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPaddedFAB() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        5.0,
        5.0,
        5.0,
        5.0,
      ),
      child: _getMainFAB(),
    );
  }

  Widget _getMaskForWidget(Widget embeddedChildWidget) {
    return Container(
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
      child: embeddedChildWidget,
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_index) {
      case 0:
        child = _getDefaultBody();
        break;
      case 1:
        child = MiCard();
        break;
      case 2:
        child =
            SettingsScreen(); //FlutterLogo(colors: Colors.red); // SettingsScreen();
        break;
    }
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
      body: SizedBox.expand(child: child),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: Colors.green,
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: Colors.red,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Colors.yellow),
              ),
        ), // sets the inactive color of the `BottomNavigationBar`
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _index,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              title: Text("Profile"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
            )
          ],
          onTap: (newIndex) {
            //print(newIndex.toString());
            setState(() {
              _index = newIndex;
            });
          },
        ),
      ),
      extendBody: true,
      floatingActionButton: _getMaskForWidget(_getPaddedFAB()),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .endTop, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
