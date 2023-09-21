import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderFavourite with ChangeNotifier {
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future getData() async {
    QuerySnapshot querySnapshot = await notes
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .where('favourite', isEqualTo: 'true')
        .get();
    return querySnapshot.docs;
  }
  Future addToFavourites(String? docId,String isFavourite) async {
    await notes.doc(docId).update({
      'favourite': isFavourite.toString() == 'false' ? 'true' : 'false',
    });
    notifyListeners();
  }

  Future deleteData(String id, BuildContext context) async {
    await FirebaseFirestore.instance.collection('notes').doc(id).delete();
    notifyListeners();
  }
}
