import 'package:flutter/material.dart';
import 'package:bank_pay/routes.dart';

class ConnectBank extends StatefulWidget {
  ConnectBank({Key? key}) : super(key: key);

  @override
  State<ConnectBank> createState() => _ConnectBankState();
}

class _ConnectBankState extends State<ConnectBank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
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
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.bakery_dining),
                    title: const Text('HBL'),
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
