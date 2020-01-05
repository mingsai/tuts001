import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.png'),
          radius: 50,
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
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Email Address',
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Password',
              alignLabelWithHint: true,
            ),
            obscureText: true,
          ),
        ),
        FlatButton.icon(
          disabledColor: Colors.brown[50],
          color: Colors.brown[100],
          onPressed: () {
            print('Begin');
          },
          icon: Icon(Icons.person),
          label: Text('Press to begin'),
        ),
      ],
    );
  }
}
