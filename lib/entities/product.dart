import 'package:floor/floor.dart';

@entity
class ProductFloor {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String? productId;
  String? name;
  int? quantity;
  String? imageUrl;
  String? category;
  double? price;
  String? description;

  ProductFloor({
    this.productId,
    this.name,
    this.quantity,
    this.imageUrl,
    this.category,
    this.price,
    this.description,
  });
}
