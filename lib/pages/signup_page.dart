import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdp_hive_store_strings/pages/signin_page.dart';

import '../services/db_services.dart';
import '../widgets/my_text_field.dart';

class SignUpPage extends StatefulWidget {
  static const String id = 'sign_up_page';
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _createAccount() {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String password = _passwordController.text.trim();

    HiveDB.storeAccountsUsername(username);
    HiveDB.storeAccountEmail(email);
    HiveDB.storeAccountPhone(phone);
    HiveDB.storeAccountPassword(password);

    String udb = HiveDB.loadAccountUsername();
    String edb = HiveDB.loadAccountEmail();
    String pndb = HiveDB.loadAccountPhone();
    String pdb = HiveDB.loadAccountPassword();
    if (kDebugMode) {
      print(udb);
      print(edb);
      print(pndb);
      print(pdb);
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xff1a1d38),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          width: w,
          height: h,
          child: Column(
            children: [
              const Spacer(flex: 9),
              const Text(
                "Create\n Account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.2,
                ),
              ),
              const Spacer(flex: 5),
              buildTextField(
                hint: "User Name",
                iconData: CupertinoIcons.person,
                controller: _usernameController,
              ),
              const Spacer(flex: 2),
              buildTextField(
                hint: "E-Mail",
                iconData: CupertinoIcons.mail,
                controller: _emailController,
              ),
              const Spacer(flex: 2),
              buildTextField(
                hint: "Phone Number",
                iconData: CupertinoIcons.phone,
                controller: _phoneController,
              ),
              const Spacer(flex: 2),
              buildTextField(
                hint: "Password",
                iconData: CupertinoIcons.lock_circle,
                controller: _passwordController,
              ),
              const Spacer(flex: 4),
              GestureDetector(
                onTap: _createAccount,
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.blue.shade900,
                        Colors.blue.shade800,
                        Colors.blue.shade700,
                        Colors.blue.shade600,
                        Colors.blue.shade500,
                        Colors.blue.shade400,
                        Colors.blue.shade300,
                      ],
                    ),
                  ),
                  child: const Icon(
                    CupertinoIcons.arrow_right,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(flex: 8),
              GestureDetector(
                onTap: () => Navigator.pushNamedAndRemoveUntil(context, SignInPage.id, (_) => false),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.white38,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.2,
                        ),
                      ),
                      TextSpan(
                        text: "SING IN",
                        style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
