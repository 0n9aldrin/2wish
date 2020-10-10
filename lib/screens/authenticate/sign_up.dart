import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:international_phone_input/international_phone_input.dart';

enum InputType { phone, sms }

class SignInByPhone extends StatefulWidget {
  @override
  _SignInByPhoneState createState() => _SignInByPhoneState();
}

class _SignInByPhoneState extends State<SignInByPhone> {
  final _phoneTextController = TextEditingController();
  final _smsCodeTextController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  String phoneNumber;
  String phoneIsoCode;
  String _verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Sign up with Phone'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _phoneNumberTextField(),
            AnimatedContainer(
                height: _verificationId == null ? 0 : 80,
                duration: const Duration(milliseconds: 400),
                child: _verificationId != null
                    ? _signUpTextFormField(InputType.sms)
                    : Container()),
            _signUpButton(InputType.phone),
            AnimatedContainer(
                height: _verificationId == null ? 0 : 74,
                duration: const Duration(milliseconds: 400),
                child: _signUpButton(InputType.sms)),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

  // ------------ Make UI Code ------------
  Widget _signUpTextFormField(InputType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: TextFormField(
        inputFormatters: [LengthLimitingTextInputFormatter(6)],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(Icons.sms),
            labelText: 'SMS Code',
            hintText: 'Type SMS Code'),
        validator: (String value) =>
            value.trim().isEmpty ? 'SMS Code is required' : null,
        controller: _smsCodeTextController,
      ),
    );
  }

  Widget _phoneNumberTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: InternationalPhoneInput(
          decoration: InputDecoration.collapsed(hintText: '(416) 123-4567'),
          onPhoneNumberChange: onPhoneNumberChange,
          initialPhoneNumber: phoneNumber,
          initialSelection: 'ID',
          enabledCountries: ['+233', '+62'],
          showCountryCodes: true),
    );
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
    });
  }

  Widget _signUpButton(InputType type) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.all(16),
        textColor: type == InputType.phone ? Colors.black : Colors.white,
        color: type == InputType.phone ? Colors.white : Colors.blue[900],
        onPressed: () => type == InputType.phone
            ? _requestSMSCodeUsingPhoneNumber()
            : _signInWithPhoneNumberAndSMSCode(),
        child: Text(
          type == InputType.phone
              ? 'Request SMS Code'
              : 'Sign in with SMS Code',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  // ------------ Make UI Code ------------

  // ------------ Functions for Sign UP Phone ------------
  void _requestSMSCodeUsingPhoneNumber() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(seconds: 60),
          verificationCompleted: (AuthCredential phoneAuthCredential) =>
              print('Sign up with phone complete'),
          verificationFailed: (FirebaseAuthException error) =>
              print('error message is ${error.message}'),
          codeSent: (String verificationId, [int forceResendingToken]) {
            print('verificationId is $verificationId');
            setState(() => _verificationId = verificationId);
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print(verificationId);
          });
    } catch (e) {
      _showSnackBar('Phone number length incorrect');
    }
  }

  void _signInWithPhoneNumberAndSMSCode() async {
    AuthCredential authCreds = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: _smsCodeTextController.text);
    try {
      final User user =
          (await FirebaseAuth.instance.signInWithCredential(authCreds)).user;
      print("User Phone number is" + user.phoneNumber);

      _smsCodeTextController.text = '';
      _phoneTextController.text = '';
      setState(() => _verificationId = null);
      FocusScope.of(context).requestFocus(FocusNode());
      _showSnackBar('Sign up with phone success. Check your firebase.');
      Navigator.pop(context);
    } catch (e) {
      _showSnackBar('Invalid verification number');
    }
  }

  // ------------ Functions for Sign UP Phone ------------

  // ------------ Show Message ------------
  void _showSnackBar(msg) {
    final snackBar = SnackBar(content: Text(msg));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
