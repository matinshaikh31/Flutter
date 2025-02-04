import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final Map<String, int> cart;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.cart,
  });

  factory UserModel.fromSnap(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return UserModel(
      uid: snapshot.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      cart: (data['cart'] as Map<String, dynamic>?)
              ?.map(((key, value) => MapEntry(key, value as int))) ??
          {},
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "cart": cart,
    };
  }
}
