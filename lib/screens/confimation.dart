import 'package:bank_pay/screens/consent.dart';
import 'package:bank_pay/screens/success.dart';
import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../widget/custom_button.dart';

class ConfirmScreen extends StatefulWidget {
  final List<Account>? selectedAccount;
  final List<Consent>? selectedConsent;
  final String? days;
  ConfirmScreen({Key? key, this.selectedAccount, this.selectedConsent, this.days}) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage(Assets.confirm),
              fit: BoxFit.fitHeight,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Confirmation',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Are you sure you want to grant access to following Account(s):',
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            for (var i = 0; i < widget.selectedAccount!.length; i++)
              if (widget.selectedAccount![i].isSelected == true)
                buildCardTile(
                  title: widget.selectedAccount![i].accountTitle,
                  desc: widget.selectedAccount![i].accountNumber,
                  type: widget.selectedAccount![i].accountType,
                ),
            SizedBox(height: 20),
            const Text(
              'With the following permission: ',
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            for (var i = 0; i < widget.selectedConsent!.length; i++)
              if (widget.selectedAccount![i].isSelected == true)
                buildCardTile(
                  title: widget.selectedConsent![i].title,
                  desc: widget.selectedConsent![i].desc,
                ),
            SizedBox(height: 20),
            Text(
              'Access Time: ${widget.days}',
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Confirm',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Success(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardTile({String? title, String? desc, String? type}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        elevation: 1.0,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                desc ?? '',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              if (type != null)
                Text(
                  type,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
