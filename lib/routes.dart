import 'package:flutter/material.dart';
import 'package:bank_pay/screens/account_auth.dart';
import 'package:bank_pay/screens/consent.dart';
import 'package:bank_pay/screens/otp.dart';
import 'package:bank_pay/screens/select_account.dart';
import 'package:bank_pay/screens/success.dart';

class Routes {
  Routes._();

  //static variables
  static const String accountAuth = '/accountAuth';
  static const String consent = '/consent';
  static const String otp = '/otp';
  static const String selectAccount = '/selectAccount';
  static const String success = '/success';

  static final routes = <String, WidgetBuilder>{
    accountAuth: (BuildContext context) => AccountAuth(),
    otp: (BuildContext context) => OTPScreen(),
    consent: (BuildContext context) => ConsentScreen(),
    selectAccount: (BuildContext context) => SelectAccount(),
    success: (BuildContext context) => Success(),
  };
}
