import 'package:authentication_using_shared_preferences/functions/auth_services_function.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'sign_up_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService _auth = AuthService();
  // SharedPreferences? sharedPreferences;

  final _formKey = GlobalKey<FormState>();
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    checkLoggedIn(AutofillHints.email, AutofillHints.password);
  }

  Future<void> checkLoggedIn(String email, String password) async {
    bool isLoggedIn = await _auth.signIn(email, password);
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter an email";
                  }
                  return null;
                },
                // validator: (value) {
                //   if (value!.isEmpty ||
                //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                //           .hasMatch(value)) {
                //     return 'Enter a valid email!';
                //   }
                //   return null;
                // },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a password";
                  }
                  return null;
                },
                // validator: (value) {
                //   if (value!.isEmpty ||
                //       !RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
                //           .hasMatch(value)) {
                //     return 'Enter a valid Password!';
                //   }
                //   return null;
                // },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool success = await _auth.signIn(
                      emailController.text,
                      passwordController.text,
                    );
                    if (success) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    } else {
                      setState(() {
                        errorMessage = "Invalid email or password";
                      });
                    }
                  }
                },
                child: const Text("Login"),
              ),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
                  );
                },
                child: const Text("Don't have an account? Sign up"),
              ),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:authentication_using_shared_preferences/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   late String _email;
//   late String _password;
//   late String _errorMessage;
//
//   @override
//   void initState() {
//     super.initState();
//     _errorMessage = '';
//   }
//
//   Future<bool> _validateCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? validEmail = prefs.getString('email');
//     String? validPassword = prefs.getString('password');
//     if (_email == validEmail && _password == validPassword) {
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   void _login() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//       bool isValid = await _validateCredentials();
//       if (isValid) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       } else {
//         setState(() {
//           _errorMessage = 'Invalid email or password';
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Center(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextFormField(
//                 decoration: const InputDecoration(
//                   hintText: 'Email',
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your email';
//                   }
//                   if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _email = value!;
//                 },
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   hintText: 'Password',
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _password = value!;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: const Text('Login'),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 _errorMessage,
//                 style: const TextStyle(color: Colors.red),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }