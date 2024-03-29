import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/first_login_shared/log_in_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email') ?? "";
  String? password = prefs.getString('password') ?? "";
  prefs.setString('email', email);
  prefs.setString('password',password);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, String? email, String? password});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

// i can able to log in but not sign up here [error -- 2]

// import 'package:authentication_using_shared_preferences/log_in_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('email', 'example@example.com');
//   prefs.setString('password', 'password123');
//   // String email = prefs.getString('email') ?? "";
//   // String password = prefs.getString('password') ?? "";
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Email Password Auth',
//       home: LoginPage(),
//     );
//   }
// }
//
//
//
// void main() => runApp(MyApp());
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setString('email', AutofillHints.email);
//   prefs.setString('password', AutofillHints.password);
//   // String? email = prefs.getString('email') ?? "";
//   // String? password = prefs.getString('password') ?? "";
//   runApp(const MyApp());
// }