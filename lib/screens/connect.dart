import 'package:bank_pay/screens/account_auth.dart';
import 'package:flutter/material.dart';
import 'package:bank_pay/routes.dart';

import '../constants/assets.dart';
import '../models/bank.dart';

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
        Bank('Al Baraka Bank', Assets.albaraka),
        Bank('Allied Bank', Assets.allied),
        Bank('Askari Bank', Assets.askari),
        Bank('Bank Alfalah', Assets.alfalah),
        Bank('Bank Al-Habib', Assets.alhabib),
        Bank('BankIslami', Assets.bankislami),
        Bank('Dubai Islamic Bank', Assets.dib),
        Bank('Faysal Bank', Assets.faysal),
        Bank('First Women Bank', Assets.fmb),
        Bank('Habib Bank', Assets.hbl),
        Bank('Standard Chartered Bank', Assets.scb),
        Bank('Habib Metropolitan Bank', Assets.habibmetro),
        Bank('JS Bank', Assets.js),
        Bank('MCB Bank', Assets.mcb),
        Bank('Meezan Bank', Assets.meezan),
        Bank('National Bank of Pakistan', Assets.national),
        Bank('Bank of Khyber', Assets.bok),
        Bank('Sindh Bank', Assets.sindh),
        Bank('Bank of Punjab', Assets.bop),
        Bank('Samba Bank', Assets.samba),
        Bank('Silkbank', Assets.silk),
        Bank('Soneri Bank', Assets.soneri),
        Bank('Summit Bank', Assets.summit),
        Bank('United Bank', Assets.ubl),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
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
                    // leading: const Icon(Icons.bakery_dining),
                    leading: Image(
                      image: AssetImage(_listBanks[index].image ?? Assets.logo),
                      fit: BoxFit.fitHeight,
                      height: 30,
                    ),
                    title: Text(_listBanks[index].bankName ?? ''),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      // Navigator.of(context).pushNamed(Routes.accountAuth);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountAuth(
                            selectedBank: _listBanks[index],
                          ),
                        ),
                      );
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
