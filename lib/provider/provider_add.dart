import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderAdd with ChangeNotifier {
  TextEditingController noteName = TextEditingController();
  TextEditingController noteContent = TextEditingController();
  TextEditingController dateTime = TextEditingController();


  int selectedColor = 0;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  bool isFavourite = false;

  Future<void> addNote(BuildContext ctx) async {
    // Call the user's CollectionReference to add a new user
    if (formState.currentState!.validate()) {
      try {
        // DocumentReference reference =
        await notes.add({
          'name': noteName.text,
          'content': noteContent.text,
          'uid': FirebaseAuth.instance.currentUser!.uid,
          'color': selectedColor,
          'time': dateTime.text,
          'favourite': isFavourite.toString()
        });

        if (ctx.mounted) {
          Navigator.of(ctx).pushNamedAndRemoveUntil('home', (route) => false);
        }
        noteName.text ='';
        noteContent.text ='';
        dateTime.text ='';
      } catch (e) {
        print("Failed to add user: $e");
      }
    }
  }

  getSelectedColor() {
    selectedColor;
    notifyListeners();
  }
}
