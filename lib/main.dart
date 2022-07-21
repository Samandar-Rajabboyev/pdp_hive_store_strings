import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdp_hive_store_strings/pages/signin_page.dart';
import 'package:pdp_hive_store_strings/pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.openBox("auth_db");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SignInPage.id: (_) => const SignInPage(),
        SignUpPage.id: (_) => const SignUpPage(),
      },
      home: const SignInPage(),
    );
  }
}
