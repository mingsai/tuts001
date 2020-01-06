import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiCard extends StatelessWidget {
  TextEditingController _emailFieldControlleer = TextEditingController();
  TextEditingController _pwdFieldControlleer = TextEditingController();

  void _dismissKeyboard(BuildContext context) {
    if (FocusScope.of(context).hasFocus) FocusScope.of(context).unfocus();
  }

  void _displaySnackBar(BuildContext context, String displayText) {
    if (displayText.isEmpty) return;
    final widget = Text(
      displayText,
      style: GoogleFonts.aladin(fontSize: 20, fontWeight: FontWeight.bold),
    );
    final snackBar = SnackBar(content: widget);
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTapUp: (details) {
//            if (MediaQuery.of(context).viewInsets.bottom != 0.0)
            _dismissKeyboard(context);
          },
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
            radius: 50,
          ),
        ),
        Text(
          'Awesome Chick',
          textAlign: TextAlign.center,
          style: GoogleFonts.actor(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 100,
          child: TextField(
            controller: _emailFieldControlleer,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Email Address',
            ),
            onEditingComplete: () {
              _dismissKeyboard(context);
//              _displaySnackBar(context, _emailFieldControlleer.text);
            },
          ),
        ),
        SizedBox(
          width: 100,
          child: TextField(
            controller: _pwdFieldControlleer,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              alignLabelWithHint: true,
            ),
            obscureText: true,
            onEditingComplete: () {
              //print(_pwdFieldControlleer.text);
              //FocusScope.of(context).unfocus();
              _dismissKeyboard(context);
//              _displaySnackBar(context, _pwdFieldControlleer.text);
            },
          ),
        ),
        FlatButton.icon(
          disabledColor: Colors.brown[50],
          color: Colors.brown[100],
          onPressed: () {
            _dismissKeyboard(context);
            final String data = 'email: ' +
                _emailFieldControlleer.text +
                ' pwd: ' +
                _pwdFieldControlleer.text;
            _displaySnackBar(context, data);

            //FocusScope.of(context).unfocus();
            print('Begin');
          },
          icon: Icon(Icons.person),
          label: Text('Press to begin'),
        ),
      ],
    );
  }
}
