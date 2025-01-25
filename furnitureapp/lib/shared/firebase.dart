import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FBAuth {
  static final auth = FirebaseAuth.instance;
}

class FBFireStore {
  static final fb = FirebaseFirestore.instance;
  static final users = fb.collection('Users');
  static final products = fb.collection('Products');
}

class FBStorage {
  static final fbstore = FirebaseStorage.instance;
}

class FBFunctions {
  static final ff = FirebaseFunctions.instance;
}
