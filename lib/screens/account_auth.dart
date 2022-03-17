import 'package:bank_pay/constants/assets.dart';
import 'package:flutter/material.dart';
import '../routes.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textfield.dart';

class AccountAuth extends StatefulWidget {
  AccountAuth({Key? key}) : super(key: key);

  @override
  State<AccountAuth> createState() => _AccountAuthState();
}

class _AccountAuthState extends State<AccountAuth> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Image(
                image: AssetImage(Assets.secure),
                fit: BoxFit.fitHeight,
                height: 100,
              ),
              const SizedBox(height: 10),
              const Text(
                'Authentication',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Please authenticate with your financial institution',
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                labelText: 'Username',
                hintText: 'Enter your username',
                prefixIconData: Icons.person,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }

                  return null;
                },
                // onSaved: (String? value) => password = value!,
              ),
              SizedBox(height: 10),
              CustomTextField(
                labelText: 'Password',
                hintText: 'Enter password',
                obscureText: true,
                prefixIconData: Icons.security,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }

                  return null;
                },
                // onSaved: (String? value) => password = value!,
              ),
              const SizedBox(height: 50),
              CustomButton(
                title: 'Proceed',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context).pushNamed(Routes.otp);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
