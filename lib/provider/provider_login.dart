import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderLogin with ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool isLoading = false;
  bool isVisible = false;

  loginWithEmailAndPassword(BuildContext ctx) async {
    
    if (formState.currentState!.validate()) {
    try {
      isLoading = true;
      addListener(() { });
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      isLoading = false ;
      addListener(() { });
      if (credential.user!.emailVerified&&ctx.mounted) {
        Navigator.of(ctx).pushNamedAndRemoveUntil('home', (route) => false);
      } else if(ctx.mounted){
        AwesomeDialog(
          context: ctx,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Email not verified',
          desc: 'Please verify your email.',
          btnOkOnPress: () {},
          btnOkText: 'Ok',
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found'&&ctx.mounted) {
        print('==============No user found for that email.');
        AwesomeDialog(
          context: ctx,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Wrong Email',
          desc: 'Please enter valid email.',
          btnOkOnPress: () {},
          btnOkText: 'Ok',
        ).show();
      } else if (e.code == 'wrong-password'&&ctx.mounted) {
        print('===============Wrong password provided for that user.');
        AwesomeDialog(
          context: ctx,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Wrong Password',
          desc: 'Wrong password provided for that user.',
          btnOkOnPress: () {},
          btnOkText: 'Ok',
        ).show();
      } else
        (print('_______________________-$e'));
    }
    }else{
      print('Not Valid');
    }
  }

  // Future<UserCredential> signInWithGoogle(BuildContext ctx) async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
    
  //   if(ctx.mounted){
  //   Navigator.of(ctx).pushNamedAndRemoveUntil('home', (route) => false);}

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  changeVisibility(){
    isVisible = !isVisible;
    notifyListeners();
  }
}
