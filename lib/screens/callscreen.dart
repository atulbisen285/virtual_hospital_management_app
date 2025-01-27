import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade700,
        title: Text('Emergency Call'),
      ),
      body: Center(
        child: CallButton(),
      ),
    );
  }
}

class CallButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.call,
        color: Colors.green,
        size: 45,
      ),
      onPressed: () {
        _makePhoneCall('tel:9098857104');
      },
    );
  }

  // Function to make a phone call
  _makePhoneCall(String phoneNumber) async {
    if (await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}