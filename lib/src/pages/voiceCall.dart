import 'package:flutter/material.dart';

class VoiceCall extends StatefulWidget {
  @override
  _VoiceCallState createState() => _VoiceCallState();
}

class _VoiceCallState extends State<VoiceCall> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Text('VOICE CALL',
                  style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.w300,
                      fontSize: 15)),
              SizedBox(
                height: 10.0,
              ),
              Text('Ravi Singh',
                  style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.w900,
                      fontSize: 20)),
              SizedBox(
                height: 40.0,
              ),
              Text('0:09',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontWeight: FontWeight.w300,
                      fontSize: 15)),
              SizedBox(
                height: 20.0,
              ),
              ClipRRect(
                child: Image.network(
                  'https://avatars3.githubusercontent.com/u/20386271?s=460&v=4',
                  height: 120,
                  width: 120,
                ),
                borderRadius: BorderRadius.circular(200.0),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _getFunctionalButton('Speaker', Icons.phone_in_talk, () {}),
                  _getFunctionalButton('Video Call', Icons.videocam, () {}),
                  _getFunctionalButton('Mute', Icons.mic_off, () {}),
                ],
              ),
              SizedBox(
                height: 100.0,
              ),
              FloatingActionButton(
                onPressed: (){},
                elevation: 20,
                shape: CircleBorder(side: BorderSide(color: Colors.red)),
                mini: false,
                child: Icon(
                  Icons.call_end,
                  color: Colors.red,
                ),
                backgroundColor: Colors.red[100],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getFunctionalButton(String title, IconData icon, Function() onPressed) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          onPressed: onPressed,
          elevation: 0,
          mini: true,
          child: Icon(
            icon,
            color: Colors.deepPurple,
          ),
          backgroundColor: Colors.grey[200],
        ),
        Text(
          title,
          style: TextStyle(fontSize: 10.0, color: Colors.deepPurple),
        )
      ],
    );
  }
}
