import 'package:flutter/material.dart';

import '../routes.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';

class ConsentScreen extends StatefulWidget {
  ConsentScreen({Key? key}) : super(key: key);

  @override
  State<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Text(
              'Consent required',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'This application needs your permission to:',
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            buildTile(
              icon: Icons.request_page_outlined,
              title: 'Access your transaction history',
              desc: 'Inflows and outflows',
            ),
            buildTile(
              icon: Icons.request_page_outlined,
              title: 'Access your selected bank account information',
              desc: 'Account number and balance',
            ),
            buildTile(
              icon: Icons.request_page_outlined,
              title: 'Access your personal information',
              desc: 'Name, email, address and phone number',
            ),
            const SizedBox(height: 50),
            CustomButton(
              title: 'Next',
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.of(context).pushNamed(Routes.selectAccount);
              },
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildTile({IconData? icon, String? title, String? desc}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        title ?? '',
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        desc ?? '',
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
