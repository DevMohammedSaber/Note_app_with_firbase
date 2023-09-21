import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderProfile with ChangeNotifier {
  // TextEditingController name = TextEditingController();
  // GlobalKey<FormState> formState = GlobalKey<FormState>();
  // CollectionReference users = FirebaseFirestore.instance.collection('users');

  List<QueryDocumentSnapshot<Object?>> data = [];

  
  

  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .get();
    return querySnapshot.docs;
    
  }

  Future deleteData(String id, BuildContext context) async {
    await FirebaseFirestore.instance.collection('users').doc(id).delete();
    notifyListeners();
  }
}
