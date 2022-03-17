import 'package:bank_pay/constants/assets.dart';
import 'package:flutter/material.dart';

import '../routes.dart';
import '../widget/custom_button.dart';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(Assets.logo),
              fit: BoxFit.fitHeight,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Welcome to Open Banking platform',
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            CustomButton(
              title: 'Continue to Open Banking',
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.of(context).pushNamed(Routes.connectBank);
              },
            ),
          ],
        ),
      ),
    );
  }
}
