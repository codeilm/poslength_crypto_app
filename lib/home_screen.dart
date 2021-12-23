import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crypto_app/utilities,dart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String message = '';
  TextStyle kTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.deepPurple,
    fontSize: 16.0,
  );

  bool showOthers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poslength'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Plain text:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
              decoration: InputDecoration(
                  hintText: 'Enter the message to be encrypted ...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    message = value.toUpperCase();
                    showOthers = true;
                  } else {
                    showOthers = false;
                  }
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            showOthers
                ? Text(
                    'Cipher text (Encryption):',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                : SizedBox(
                    height: 0.0,
                  ),
            showOthers
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.blueAccent,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(encrypt(message, key(message)),
                          style: kTextStyle),
                    ))
                : SizedBox(
                    height: 0.0,
                  ),
            SizedBox(
              height: 20.0,
            ),
            showOthers
                ? Text(
                    'Plain text (Decryption):',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  )
                : SizedBox(
                    height: 0.0,
                  ),
            showOthers
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                        color: Colors.blueAccent,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        decrypt(encrypt(message, key(message)), key(message)),
                        style: kTextStyle,
                      ),
                    ))
                : SizedBox(
                    height: 0.0,
                  ),
          ],
        ),
      ),
    );
  }
}
