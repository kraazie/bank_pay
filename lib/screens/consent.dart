import 'package:bank_pay/screens/confimation.dart';
import 'package:flutter/material.dart';

import '../constants/assets.dart';
import '../routes.dart';
import '../widget/custom_button.dart';
import '../widget/custom_dropdown.dart';

class Account {
  String? accountNumber;
  String? accountTitle;
  String? accountType;
  bool? isSelected;

  Account(this.accountNumber, this.accountTitle, this.accountType, this.isSelected);
}

class Consent {
  String? title;
  String? desc;
  bool? isSelected;

  Consent(this.title, this.desc, this.isSelected);
}

class ConsentScreen extends StatefulWidget {
  ConsentScreen({Key? key}) : super(key: key);

  @override
  State<ConsentScreen> createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  bool _value = false;
  int val = -1;
  List<Account> _listAccounts = [];
  List<Consent> _listConsents = [];
  String? _selectedCityId;

  @override
  void initState() {
    super.initState();

    _listAccounts.addAll(
      [
        Account('453845793475', 'Abdus Samad Khan', 'Current Account (PKR)', false),
        Account('453845793475', 'Abdus Samad Khan', 'Savings Account (PKR)', false),
        Account('453845793475', 'Abdus Samad Khan', 'FCY Account (USD)', false),
      ],
    );

    _listConsents.addAll(
      [
        Consent('Access your transaction history', 'Inflows and outflows', false),
        Consent('Access your selected bank account information', 'Account number and balance', false),
        Consent('Access your personal information', 'Name, email, address and phone number', false),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Image(
              image: AssetImage(Assets.consent),
              fit: BoxFit.fitHeight,
              height: 100,
            ),
            const SizedBox(height: 10),
            const Text(
              'Select Account',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Please select accounts to link',
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _listAccounts.length,
              itemBuilder: (BuildContext context, int index) {
                return buildCardTile(
                  icon: Icons.request_page_outlined,
                  title: _listAccounts[index].accountTitle,
                  desc: _listAccounts[index].accountNumber,
                  type: _listAccounts[index].accountType,
                  index: index,
                );
              },
            ),
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
            ListView.builder(
              shrinkWrap: true,
              itemCount: _listConsents.length,
              itemBuilder: (BuildContext context, int index) {
                return buildConsentTile(
                  icon: Icons.request_page_outlined,
                  title: _listConsents[index].title,
                  desc: _listConsents[index].desc,
                  index: index,
                );
              },
            ),
            const Text(
              'Access Time',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Grant access for following days:',
              style: TextStyle(
                fontSize: 14,
                // fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomDropDown(
              icon: Icons.location_city_rounded,
              selectedValue: _selectedCityId,
              hintText: 'Expiry',
              itemsList: ["1 Day", "3 Days", "1 Week", "15 Days", "1 Month"].map<DropdownMenuItem<String>>((item) {
                return DropdownMenuItem(
                  child: Text(item),
                  value: item,
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  print(value);
                  _selectedCityId = value;
                });
                // FocusScope.of(context).requestFocus(focusEmail);
              },
            ),
            const SizedBox(height: 20),
            CustomButton(
              title: 'Continue',
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmScreen(
                      selectedAccount: _listAccounts,
                      selectedConsent: _listConsents,
                      days: _selectedCityId,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildConsentTile({IconData? icon, String? title, String? desc, required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        elevation: 1.0,
        child: InkWell(
          onTap: () {
            setState(() {
              if (_listConsents[index].isSelected == true) {
                _listConsents[index].isSelected = false;
              } else if (_listConsents[index].isSelected == false) {
                _listConsents[index].isSelected = true;
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                _listConsents[index].isSelected!
                    ? const Icon(Icons.check_box)
                    : const Icon(Icons.check_box_outline_blank),
                SizedBox(width: 20),
                Column(
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardTile({IconData? icon, String? title, String? desc, String? type, required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        elevation: 1.0,
        child: InkWell(
          onTap: () {
            setState(() {
              if (_listAccounts[index].isSelected == true) {
                _listAccounts[index].isSelected = false;
              } else if (_listAccounts[index].isSelected == false) {
                _listAccounts[index].isSelected = true;
              }
            });
          },
          child: Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                _listAccounts[index].isSelected!
                    ? const Icon(Icons.radio_button_checked)
                    : const Icon(Icons.radio_button_unchecked),
                SizedBox(width: 20),
                Column(
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
                    Text(
                      type ?? '',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
