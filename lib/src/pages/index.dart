import 'package:agora_flutter_quickstart/src/pages/voiceCall.dart';
import 'package:flutter/material.dart';
import './call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new IndexState();
  }
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textfield is validated to have error
  bool _validateError = false;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Video Call'),
        ),
        body: Center(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 400,
              child: Column(
                children: <Widget>[
                  Row(children: <Widget>[]),
                  Row(children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: _channelController,
                      decoration: InputDecoration(
                          errorText: _validateError
                              ? "Channel name is mandatory"
                              : null,
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(width: 1)),
                          hintText: 'Channel name'),
                    ))
                  ]),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: RaisedButton(
                              onPressed: () => onJoin(0),
                              child: Text("Join Video Call"),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: RaisedButton(
                              onPressed: () => onJoin(1),
                              child: Text("Join Voice Call"),
                              color: Colors.blueAccent,
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      ))
                ],
              )),
        ));
  }

  onJoin(int callType) {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // push video page with given channel name
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => redirectToPage(callType)));
    }
  }

  redirectToPage(int callType) {
    switch (callType) {
      case 0:
        return CallPage(
          channelName: _channelController.text,
        );
      case 1:
        return VoiceCall();
      /*  return VoiceCall(
          channelName: _channelController.text,
        );*/
    }
  }
}
