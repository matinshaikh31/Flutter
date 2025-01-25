import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  final String id;
  final String? availability;
  final String category;
  final String color;
  final String description;
  final String images;
  final String material;
  final String name;
  final String price;

  Products(
      {required this.id,
      required this.availability,
      required this.category,
      required this.color,
      required this.description,
      required this.images,
      required this.material,
      required this.name,
      required this.price});

  factory Products.fromSnap(QueryDocumentSnapshot<Map<String, dynamic>> data) {
    // print(data.data());

    return Products(
      id: data.id,
      availability: data["availability"],
      category: data['category'],
      color: data['color'],
      description: data['description'],
      images: data['images'],
      material: data['material'],
      name: data['name'],
      price: data['price'],
    );
  }
}
