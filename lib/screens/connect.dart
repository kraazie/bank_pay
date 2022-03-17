import 'package:flutter/material.dart';
import 'package:bank_pay/routes.dart';

import '../constants/assets.dart';

class Bank {
  String? bankName;
  String? image;
  Bank(this.bankName, this.image);
}

class ConnectBank extends StatefulWidget {
  ConnectBank({Key? key}) : super(key: key);

  @override
  State<ConnectBank> createState() => _ConnectBankState();
}

class _ConnectBankState extends State<ConnectBank> {
  List<Bank> _listBanks = [];
  @override
  void initState() {
    super.initState();

    _listBanks.addAll(
      [
        Bank('Al Baraka Bank (Pakistan) Limited', ''),
        Bank('Allied Bank Limited', ''),
        Bank('Askari Bank', ''),
        Bank('Bank Alfalah Limited', ''),
        Bank('Bank Al-Habib Limited', ''),
        Bank('BankIslami Pakistan Limited', ''),
        Bank('Citi Bank', ''),
        Bank('Dubai Islamic Bank Pakistan Limited', ''),
        Bank('Faysal Bank Limited', ''),
        Bank('First Women Bank Limited', ''),
        Bank('Habib Bank Limited', ''),
        Bank('Standard Chartered Bank (Pakistan) Limited', ''),
        Bank('Habib Metropolitan Bank Limited', ''),
        Bank('Industrial and Commercial Bank of China', ''),
        Bank('Industrial Development Bank of Pakistan', ''),
        Bank('JS Bank Limited', ''),
        Bank('MCB Bank Limited', ''),
        Bank('MCB Islamic Bank Limited', ''),
        Bank('Meezan Bank Limited', ''),
        Bank('National Bank of Pakistan', ''),
        Bank('Bank of Khyber', ''),
        Bank('Sindh Bank', ''),
        Bank('Bank of Punjab', ''),
        Bank('Samba Bank Limited', ''),
        Bank('Silkbank Limited', ''),
        Bank('Soneri Bank', ''),
        Bank('Summit Bank', ''),
        Bank('United Bank Limited', ''),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Image(
              image: AssetImage(Assets.logo),
              fit: BoxFit.fitHeight,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Connect to your institution',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Select an institution below to authorize a secure connection',
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _listBanks.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.bakery_dining),
                    title: Text(_listBanks[index].bankName ?? ''),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.accountAuth);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
