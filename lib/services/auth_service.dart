// // ignore_for_file: use_build_context_synchronously
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthProvider with ChangeNotifier {
//   TextEditingController registerUserName = TextEditingController();
//   TextEditingController registerEmail = TextEditingController();
//   TextEditingController registerPassword = TextEditingController();

//   TextEditingController loginEmail = TextEditingController();
//   TextEditingController loginPassword = TextEditingController();

//   GlobalKey<FormState> formStateLogin = GlobalKey<FormState>();
//   GlobalKey<FormState> formStateSignUp = GlobalKey<FormState>();

//   creatEmailWithEmailAndPassword(BuildContext ctx) async {
//     try {
//       final credential =
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: registerEmail.text,
//         password: registerPassword.text,
//       );
//       Navigator.of(ctx).pushReplacementNamed('home');
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   signInWithEmailAndPassword(BuildContext ctx) async {
//     // Trigger the authentication flow

//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//         email: loginEmail.text,
//         password: loginPassword.text,
//       );
//       Navigator.of(ctx).pushReplacementNamed('home');
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('==============No user found for that email.');
//         return AwesomeDialog(
//           context: ctx,
//           dialogType: DialogType.info,
//           animType: AnimType.rightSlide,
//           title: 'Dialog Title',
//           desc: 'No user found for that email.',
//           btnCancelOnPress: () {},
//           btnOkOnPress: () {},
//         ).show();
//       } else if (e.code == 'wrong-password') {
//         print('===============Wrong password provided for that user.');
//         AwesomeDialog(
//           context: ctx,
//           dialogType: DialogType.info,
//           animType: AnimType.rightSlide,
//           title: 'Dialog Title',
//           desc: 'Wrong password provided for that user.',
//           btnCancelOnPress: () {},
//           btnOkOnPress: () {},
//         ).show();
//       }
//     }
//   }

// //     Future<UserCredential> signInWithGoogle() async {
// //     // Trigger the authentication flow
// //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

// //     // Obtain the auth details from the request
// //     final GoogleSignInAuthentication? googleAuth =
// //         await googleUser?.authentication;

// //     // Create a new credential
// //     final credential = GoogleAuthProvider.credential(
// //       accessToken: googleAuth?.accessToken,
// //       idToken: googleAuth?.idToken,
// //     );

// //     // Once signed in, return the UserCredential
// //     final UserCredential user =
// //         await FirebaseAuth.instance.signInWithCredential(credential);
// //     print(user.user!.displayName);
// //     return user;
// //   }

// //   signOut()async{
// //   await FirebaseAuth.instance.signOut();
// // }
// }
