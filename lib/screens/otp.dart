import 'dart:async';

import 'package:bank_pay/screens/connecting.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pin_put/pin_put.dart';

import '../constants/assets.dart';
import '../constants/color.dart';
import '../models/bank.dart';
import '../routes.dart';
import '../widget/custom_button.dart';

class OTPScreen extends StatefulWidget {
  final Bank? selectedBank;
  OTPScreen({Key? key, this.selectedBank}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  String otp = "";
  Timer? _timer;
  int _counter = 0;
  bool _isVerifyEnabled = false;

  String? otpCode;

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: ListView(
          children: [
            const Image(
              image: AssetImage(Assets.otp),
              fit: BoxFit.fitHeight,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    "Please enter verification code sent to your mobile number 031******44",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF717E95),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${_durationTransform()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.PrimaryColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  justRoundedCornersPinPut(),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      title: 'Verify',
                      onPressed: _isVerifyEnabled && _counter > 0 ? onPressedVerify : null,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't you receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    print('Resend Pressed..!!');
                    // _postResendOTP();
                  },
                  child: const Text(
                    "Resend",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.PrimaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget justRoundedCornersPinPut() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(
        color: CustomColors.PrimaryColor,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: PinPut(
        autofocus: true,
        fieldsCount: 6,
        withCursor: false,
        textStyle: const TextStyle(
          fontSize: 25.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        eachFieldWidth: 45.0,
        eachFieldHeight: 50.0,
        onChanged: (String v) {
          v.length == 6 ? _isVerifyEnabled = true : _isVerifyEnabled = false;
        },
        onSubmit: (String value) {
          // Common.customLog(value);
          otp = value;
        },
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
          TextInputFormatter.withFunction((oldValue, newValue) {
            try {
              final text = newValue.text;
              if (text.isNotEmpty) double.parse(text);
              return newValue;
            } catch (e) {}
            return oldValue;
          }),
        ],
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        submittedFieldDecoration: pinPutDecoration,
        selectedFieldDecoration: pinPutDecoration,
        followingFieldDecoration: pinPutDecoration,
        pinAnimationType: PinAnimationType.fade,
      ),
    );
  }

  void onPressedVerify() {
    {
      FocusScope.of(context).unfocus();

      if (otp.length == 6) {
        // Navigator.of(context).pushNamed(Routes.connecting);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Connecting(selectedBank: widget.selectedBank),
          ),
        );
      }
    }
  }

  void _startTimer() {
    _counter = 120;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  String _durationTransform() {
    var d = Duration(seconds: _counter);
    List<String> parts = d.toString().split(':');
    var m = parts[1];
    var s = parts[2].substring(0, 2);

    return '$m : $s';
  }
}
