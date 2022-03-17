import 'package:flutter/material.dart';

import '../routes.dart';
import '../widget/custom_button.dart';
import '../widget/custom_dropdown.dart';

class Account {
  String? accountNumber;
  String? accountTitle;
  bool? isSelected;

  Account(this.accountNumber, this.accountTitle, this.isSelected);
}

class SelectAccount extends StatefulWidget {
  SelectAccount({Key? key}) : super(key: key);

  @override
  State<SelectAccount> createState() => _SelectAccountState();
}

class _SelectAccountState extends State<SelectAccount> {
  bool _value = false;
  int val = -1;
  List<Account> _listAccounts = [];
  String? _selectedCityId;

  @override
  void initState() {
    super.initState();

    _listAccounts.addAll(
      [
        Account('453845793475', 'Abdus Samad Khan', false),
        Account('453845793475', 'Ali Shah', false),
        Account('453845793475', 'Ali Ghani', false),
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
              itemCount: _listAccounts.length,
              itemBuilder: (BuildContext context, int index) {
                return buildTile(
                  icon: Icons.request_page_outlined,
                  title: _listAccounts[index].accountTitle,
                  desc: _listAccounts[index].accountNumber,
                  index: index,
                );
              },
            ),
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
            const SizedBox(height: 50),
            CustomButton(
              title: 'Continue',
              onPressed: () {
                FocusScope.of(context).unfocus();
                Navigator.of(context).pushNamed(Routes.success);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTile({IconData? icon, String? title, String? desc, required int index}) {
    return Card(
      child: RadioListTile(
        contentPadding: EdgeInsets.zero,
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
        value: _listAccounts[index].isSelected!,
        onChanged: (value) {
          setState(() {
            val = value as int;
            _listAccounts[index].isSelected = val == 1 ? true : false;
          });
        },
        groupValue: _listAccounts[index].isSelected!,
      ),
    );
  }
}
