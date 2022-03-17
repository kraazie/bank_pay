import 'dart:async';

import 'package:bank_pay/constants/color.dart';
import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../models/bank.dart';
import '../routes.dart';

class Connecting extends StatefulWidget {
  final Bank? selectedBank;
  Connecting({Key? key, this.selectedBank}) : super(key: key);

  @override
  State<Connecting> createState() => _ConnectingState();
}

class _ConnectingState extends State<Connecting> {
  Timer? _timer;
  int _counter = 0;

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
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(widget.selectedBank!.image ?? Assets.logo),
                fit: BoxFit.fitHeight,
                height: 100,
              ),
              const SizedBox(height: 10),
              const Text(
                'Connecting with...',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Text(
                '${widget.selectedBank!.bankName}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  color: CustomColors.PrimaryColor,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Estabilishing a secure connection',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _startTimer() {
    var _duration = const Duration(milliseconds: 3000);
    return Timer(_duration, navigate);
  }

  void navigate() {
    Navigator.of(context).pushNamed(Routes.consent);
  }
}
