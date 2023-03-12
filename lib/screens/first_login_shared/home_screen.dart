import 'package:flutter/material.dart';
import '../../functions/auth_services_function.dart';
import 'log_in_screen.dart';


class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: FutureBuilder(
          future: _auth.initPrefs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final String savedEmail = _auth.prefs.getString("userEmail") ?? "";
              final String savedPassword = _auth.prefs.getString("userPassword") ?? "";

              if (savedEmail.isNotEmpty && savedPassword.isNotEmpty) {
                return Text("Logged in as $savedEmail");
              } else {
                return const Text("No user logged in");
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _auth.signOut();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Welcome'),
//       ),
//       body: const Center(
//         child: Text('You are logged in!'),
//       ),
//     );
//   }
// }



// void _login() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String email = prefs.getString('email') ?? "";
//   String password = prefs.getString('password') ?? "";
//
//   // You can remove this

/// ________________________________________________________________________
// import 'package:flutter/material.dart';
//
// import 'functions/auth_services_function.dart';
// import 'log_in_screen.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final AuthService _auth = AuthService();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () async {
//               await _auth.signOut();
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => const LoginPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: const Center(
//         child: Text("You are logged in!"),
//       ),
//     );
//   }
// }
/// ________________________________________________________________________
///
