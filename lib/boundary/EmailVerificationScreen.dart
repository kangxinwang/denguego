import 'package:denguego/boundary/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flushbar/flushbar.dart';
import 'package:denguego/controller/AuthenticateManager.dart';
import 'package:email_validator/email_validator.dart';
class EmailVerification extends StatefulWidget {
  static String id = "Verification";


  @override
  _EmailVerificationState createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final AuthenticateManager _auth = AuthenticateManager();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String email='';
  bool showSpinner = false;
  void sendOtp() async {
    EmailAuth.sessionName = "Email verification";
    var res = await EmailAuth.sendOtp(receiverMail: _emailController.text);
    if (res) {
      print("OTP sent");
    }
    else {
      print("We could not send the OTP");
    }
  }

  Future<bool> verifyOTP() async {
    var res = EmailAuth.validate(
        receiverMail: _emailController.text, userOTP: _otpController.text);
    if (res) {
      print("OTP verified");
      return true;
     // Navigator.pushNamed(context, SignupScreen.id);
    }
    else {
      return false;
    }
  }



  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text('Verify Email'),
    ),
    body: Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    labelText: "Email",

                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),

                      onPressed: ()
                        async {

                            final bool emailCheck =
                                await _auth.emailAuthentication(email);
                            if (emailCheck) {
                              Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                flushbarStyle: FlushbarStyle.FLOATING,
                                backgroundColor: Color(0xffe25757),
                                margin: EdgeInsets.all(8),
                                borderRadius: 8,
                                icon: Icon(
                                  Icons.warning_amber_rounded,
                                  size: 35.0,
                                  color: Colors.black,
                                ),
                                leftBarIndicatorColor: Colors.black,
                                messageText: Text(
                                    "Email exists!\nTry a different email",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        fontFamily: 'Montserrat')
                                ),
                                duration: Duration(seconds: 3),
                              )..show(context);
                              setState(() => showSpinner = false);
                            } else {
                              sendOtp();
                            }
                        }

                      )
                        ),
                      validator: (val) =>
                      !EmailValidator.validate(val, true)
                        ? 'Invalid email.'
                            : null,
                        onChanged: (val) {
                        setState(() => email = val);
                        }
                        ),
                        SizedBox(
                        height: 30.0,
                        ),
                        TextField(
                        controller: _otpController,
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                        hintText: "Enter OTP",
                        labelText: "OTP"
                        ),
                        ),
                        SizedBox(
                        height: 30.0,
                        ),
                        TextButton(
                        child: Text("Verify OTP"),
                        onPressed: ()  => verifyOTP==true? SignupScreen(email): '',
                        )
                        ],
                        ),
                        )
                        ],
                        ),
                        );
                        }
  }



