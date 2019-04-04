import 'dart:async';

import 'package:flutter/material.dart';

class VoiceCall extends StatefulWidget {
  @override
  _VoiceCallState createState() => _VoiceCallState();
}

class _VoiceCallState extends State<VoiceCall> {
  Timer _timer;
  int _start = 0;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(() {
              if (_start < 0) {
                timer.cancel();
              } else {
                _start = _start + 1;
              }
            }));
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
                      color: Colors.deepPurple[900],
                      fontWeight: FontWeight.w300,
                      fontSize: 15)),
              SizedBox(
                height: 20.0,
              ),
              Text('Ravi Shankar Singh',
                  style: TextStyle(
                      color: Colors.deepPurple[900],
                      fontWeight: FontWeight.w900,
                      fontSize: 20)),
              SizedBox(
                height: 20.0,
              ),
              Text('$_start',
                  style: TextStyle(
                      color: Colors.deepPurple[900],
                      fontWeight: FontWeight.w300,
                      fontSize: 15)),
              SizedBox(
                height: 20.0,
              ),
              ClipRRect(
                child: Image.network(
                  'https://avatars3.githubusercontent.com/u/20386271?s=460&v=4',
                  height: 200,
                  width: 200,
                ),
                borderRadius: BorderRadius.circular(200.0),
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FunctionalButton(
                    key: Key('Speaker'),
                    title: 'Speaker',
                    icon: Icons.phone_in_talk,
                    onPressed: null,
                  ),
                  FunctionalButton(
                      title: 'Video Call',
                      icon: Icons.videocam,
                      onPressed: () {}),
                  FunctionalButton(
                      title: 'Mute', icon: Icons.mic_off, onPressed: () {}),
                ],
              ),
              SizedBox(
                height: 150.0,
              ),
              FloatingActionButton(
                onPressed: () {},
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
}

class FunctionalButton extends StatefulWidget {
  final title;
  final icon;
  final Function() onPressed;

  const FunctionalButton({Key key, this.title, this.icon, this.onPressed})
      : super(key: key);

  @override
  _FunctionalButtonState createState() => _FunctionalButtonState();
}

class _FunctionalButtonState extends State<FunctionalButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(200.0),
          child: IconButton(
            icon: Icon(
              widget.icon,
              color: Colors.deepPurple,
            ),
            onPressed: widget.onPressed,
            color: Colors.grey[400],
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(fontSize: 10.0, color: Colors.deepPurple),
        )
      ],
    );
  }
}
