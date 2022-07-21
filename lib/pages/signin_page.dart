import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdp_hive_store_strings/pages/signup_page.dart';
import 'package:pdp_hive_store_strings/services/db_services.dart';

import '../widgets/my_text_field.dart';

class SignInPage extends StatefulWidget {
  static const String id = 'sign_in_page';
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _doLogin() {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    HiveDB.storeUsersUsername(username);
    HiveDB.storeUsersPassword(password);

    String udb = HiveDB.loadUsersUsername();
    String pdb = HiveDB.loadUsersPassword();
    if (kDebugMode) {
      print(udb);
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
              const Spacer(flex: 8),
              Container(
                width: 66,
                height: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/avatar.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              const Text(
                "Welcome Back!",
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 8),
              const Text(
                "Sign in to continue",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
              ),
              const Spacer(flex: 5),
              buildTextField(
                hint: "User Name",
                iconData: CupertinoIcons.person,
                controller: _usernameController,
              ),
              const Spacer(),
              buildTextField(
                hint: "Password",
                iconData: CupertinoIcons.lock_circle,
                controller: _passwordController,
              ),
              const Spacer(flex: 2),
              const Text(
                "Forget Password?",
                style: TextStyle(color: Colors.white38, fontSize: 14, fontWeight: FontWeight.w400),
              ),
              const Spacer(flex: 3),
              GestureDetector(
                onTap: _doLogin,
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
                    )),
              ),
              const Spacer(flex: 7),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, SignUpPage.id),
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
                        text: "SING UP",
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
