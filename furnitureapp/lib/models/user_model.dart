import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String password;
  final List cart;
  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.password,
      required this.cart});

  factory UserModel.fromSnap(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uid: data['uid'] ?? '',
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      password: data['password'],
      cart: List<String>.from(data['cart'] ?? []),
    );
  }
}
