import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  late SharedPreferences prefs;

  AuthService() {
    initPrefs();
  }

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> signUp(String email, String password) async {
    try {
      // Initialize shared preferences
      await initPrefs();

      // Implement your sign up logic here
      // ...

      // Save user information in shared preferences
      await prefs.setString("userEmail", email);
      await prefs.setString("userPassword", password);

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      // Initialize shared preferences
      await initPrefs();

      // Get user information from shared preferences
      final String savedEmail = prefs.getString("userEmail") ?? "";
      final String savedPassword = prefs.getString("userPassword") ?? "";

      // Check if the entered email and password match the saved ones
      if (savedEmail == email && savedPassword == password) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> signOut() async {
    // Initialize shared preferences
    await initPrefs();

    // Remove user information from shared preferences
    await prefs.remove("userEmail");
    await prefs.remove("userPassword");
  }
}

// import 'package:shared_preferences/shared_preferences.dart';
//
// class AuthService {
//   final SharedPreferences prefs =
//       SharedPreferences.getInstance() as SharedPreferences;
//
//   Future<bool> signIn(String email, String password) async {
//     // Here you would normally make an API call to authenticate the user
//     // For this example, we'll just check if the email and password are hardcoded
//     if (email == "example@example.com" && password == "password") {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString("email", email);
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   Future<bool> signUp(String email, String password) async {
//     // Here you would normally make an API call to create a new user account
//     // For this example, we'll just return true if the email and password are not empty
//     if (email.isNotEmpty && password.isNotEmpty) {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       await prefs.setString("email", email);
//       return true;
//     } else {
//       return false;
//     }
//   }
//
//   Future<bool> signUpUserSave(String email, String password) async {
//     try {
// // Implement your sign up logic here
// // ...
//       // Save user information in shared preferences
//       await prefs.setString("email", email);
//       await prefs.setString("password", password);
//
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
//
//   Future<bool> signInSave(String email, String password) async {
//     try {
// // Get user information from shared preferences
//       final String savedEmail = prefs.getString("email") ?? "";
//       final String savedPassword = prefs.getString("password") ?? "";
//       // Check if the entered email and password match the saved ones
//       if (savedEmail == email && savedPassword == password) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
//
//   Future<bool> isLoggedIn() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString("email") != null;
//     // return prefs.getInt("password") != null;
//   }
//
//   Future<void> signOut() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove("email");
//     // Remove user information from shared preferences
//     await prefs.remove("password");
//   }
// }

//// ______________________________________________________________________________
//// ______________________________________________________________________________
//// ______________________________________________________________________________
// import 'package:shared_preferences/shared_preferences.dart';
//
// class AuthService {
//   late SharedPreferences prefs;
//
//   Future<void> initPrefs() async {
//     prefs = await SharedPreferences.getInstance();
//   }
//
//   Future<bool> signUp(String email, String password) async {
//     try {
//       // Initialize shared preferences
//       if (prefs == null) await initPrefs();
//
//       // Implement your sign up logic here
//       // ...
//
//       // Save user information in shared preferences
//       await prefs.setString("email", email);
//       await prefs.setString("password", password);
//
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
//
//   Future<bool> signIn(String email, String password) async {
//     try {
//       // Initialize shared preferences
//       if (prefs == null) await initPrefs();
//
//       // Get user information from shared preferences
//       final String savedEmail = prefs.getString("email") ?? "";
//       final String savedPassword = prefs.getString("password") ?? "";
//
//       // Check if the entered email and password match the saved ones
//       if (savedEmail == email && savedPassword == password) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
//
//   Future<void> signOut() async {
//     // Initialize shared preferences
//     if (prefs == null) await initPrefs();
//
//     // Remove user information from shared preferences
//     await prefs.remove("email");
//     await prefs.remove("password");
//   }
// }
//// ______________________________________________________________________________
// class AuthService {
//   late SharedPreferences prefs;
//
//   AuthService() {
//     initPrefs();
//   }
//
//   Future<void> initPrefs() async {
//     prefs = await SharedPreferences.getInstance();
//   }
//
//   Future<bool> signUp(String email, String password) async {
//     try {
//       // Initialize shared preferences
//       await initPrefs();
//
//       // Implement your sign up logic here
//       // ...
//
//       // Save user information in shared preferences
//       await prefs.setString("email", email);
//       await prefs.setString("password", password);
//
//       return true;
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
//
//   Future<bool> signIn(String email, String password) async {
//     try {
//       // Initialize shared preferences
//       await initPrefs();
//
//       // Get user information from shared preferences
//       final String savedEmail = prefs.getString("email") ?? "";
//       final String savedPassword = prefs.getString("password") ?? "";
//
//       // Check if the entered email and password match the saved ones
//       if (savedEmail == email && savedPassword == password) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       print(e);
//       return false;
//     }
//   }
//
//   Future<void> signOut() async {
//     // Initialize shared preferences
//     await initPrefs();
//
//     // Remove user information from shared preferences
//     await prefs.remove("email");
//     await prefs.remove("password");
//   }
// }

//// ______________________________________________________________________________
