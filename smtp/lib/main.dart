import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() {
  runApp(MaterialApp(
    home: OTPScreen(),
  ));
}

class OTPScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = '';
  String _sentOTP = '';

  void _sendOTP(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _sentOTP = _generateOTP();
      // Replace these with your SMTP server configuration
      final smtpServer = SmtpServer('smtp.gmail.com',
          username: 'oholomkar40@gmail.com', password: 'zxeq felp vwan xtgf');

      final message = Message()
        ..from = Address('oholomkar40@gmail.com', 'Omkar')
        ..recipients.add(_email)
        ..subject = 'OTP Verification'
        ..text = 'Your OTP is: $_sentOTP';

      try {
        final sendReport = await send(message, smtpServer);
        print('Message sent: ' + sendReport.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('OTP sent to $_email'),
          ),
        );

        // Navigate to OTP verification screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OTPVerificationScreen(_sentOTP),
          ),
        );
      } catch (e) {
        print('Error sending OTP: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to send OTP'),
          ),
        );
      }
    }
  }

  String _generateOTP() {
    // Generate a random 4-digit OTP
    return (1000 + (DateTime.now().millisecondsSinceEpoch % 9000)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Enter Email Address'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email address';
                  }
                  return null;
                },
                onChanged: (value) {
                  _email = value;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _sendOTP(context),
                child: Text('Send OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPVerificationScreen extends StatelessWidget {
  final String _sentOTP;

  OTPVerificationScreen(this._sentOTP);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _enteredOTP = '';

  void _verifyOTP(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      if (_enteredOTP == _sentOTP) {
        // Navigate to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Invalid OTP'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Enter OTP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter OTP';
                  }
                  return null;
                },
                onChanged: (value) {
                  _enteredOTP = value;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () => _verifyOTP(context),
                child: Text('Verify OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Image(image: NetworkImage('https://avatars.githubusercontent.com/u/90202424?v=4'),)
      ),
    );
  }
}
