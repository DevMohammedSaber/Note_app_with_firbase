import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderEdit with ChangeNotifier {
  TextEditingController noteName = TextEditingController();
  TextEditingController noteContent = TextEditingController();
  TextEditingController dateTime = TextEditingController();

  int selectedColor = 0;

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  get addToFavourite => addToFavourite();

  Future<void> editNote(
    BuildContext ctx,
    String? docId,
  ) async {
    try {
      // DocumentReference reference =
      await notes.doc(docId).update({
        'name': noteName.text,
        'content': noteContent.text,
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'color': selectedColor,
        'time': dateTime.text,
      });

      if (ctx.mounted) {
        Navigator.of(ctx).pushNamedAndRemoveUntil('home', (route) => false);
      }
    } catch (e) {
      print("Failed to add user: $e");
    }
  }

  getSelectedColor() {
    selectedColor;
    notifyListeners();
  }
}
