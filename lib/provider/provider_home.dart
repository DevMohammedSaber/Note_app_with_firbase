import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class ProviderHome with ChangeNotifier {
  // final GlobalKey<SliderDrawerState> sliderDrawerKey =
  //     GlobalKey<SliderDrawerState>();

  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future getData() async {
    QuerySnapshot querySnapshot = await notes
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();
    return querySnapshot.docs;
  }

  Future addToFavourites(String? docId, String isFavourite) async {
    await notes.doc(docId).update({
      'favourite': isFavourite.toString() == 'false' ? 'true' : 'false',
    });
    notifyListeners();
  }

  Future deleteData(String id, BuildContext context) async {
    await FirebaseFirestore.instance.collection('notes').doc(id).delete();
    notifyListeners();
  }

  signOut(BuildContext ctx) async {
    FirebaseAuth.instance.signOut();
    Navigator.of(ctx)
        .restorablePushNamedAndRemoveUntil('login', (route) => false);
  }
}
