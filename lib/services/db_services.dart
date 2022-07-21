import 'package:hive/hive.dart';

class HiveDB {
  static var box = Hive.box("auth_db");

  /// For User Information
  // user's username
  static void storeUsersUsername(String username) {
    box.put('user_username', username);
  }

  static String loadUsersUsername() {
    return box.get('user_username');
  }

  static void removeUsersUsername() {
    box.delete("user_username");
  }

  // user's password
  static void storeUsersPassword(String password) {
    box.put('user_password', password);
  }

  static String loadUsersPassword() {
    return box.get('user_password');
  }

  static void removeUsersPassword() {
    box.delete("user_password");
  }

  /// For Account Information
  // new account's username
  static void storeAccountsUsername(String username) {
    box.put('account_username', username);
  }

  static String loadAccountUsername() {
    return box.get('account_username');
  }

  static void removeAccountUsername() {
    box.delete("account_username");
  }

  // new account's email
  static void storeAccountEmail(String email) {
    box.put('account_email', email);
  }

  static String loadAccountEmail() {
    return box.get('account_email');
  }

  static void removeAccountEmail() {
    box.delete("account_email");
  }

  // new account's phone number
  static void storeAccountPhone(String phone) {
    box.put('account_phone_number', phone);
  }

  static String loadAccountPhone() {
    return box.get('account_phone_number');
  }

  static void removeAccountPhone() {
    box.delete("account_phone_number");
  }

  // new account's password
  static void storeAccountPassword(String password) {
    box.put('account_password', password);
  }

  static String loadAccountPassword() {
    return box.get('account_password');
  }

  static void removeAccountPassword() {
    box.delete("account_password");
  }
}
