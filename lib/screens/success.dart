import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              'Connected!',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Your account was successfully connected!',
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Icon(
              Icons.check_circle_outlined,
            ),
            const Text(
              'A connection to your bank has been made!',
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
