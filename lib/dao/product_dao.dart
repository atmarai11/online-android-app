import 'package:floor/floor.dart';

import '../entities/product.dart';

@dao
abstract class ProductDAO {
  @insert
  Future<void> insertSpot(ProductFloor product);

  @Query('select DISTINCT name,description,price from productfloor')
  Future<List<ProductFloor?>> getAllMobiles();

  @Query("DROP TABLE IF EXISTS [dbo].[productfloor]")
  Future<void> dropTable();
}
