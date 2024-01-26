import 'package:floor/floor.dart';
import 'dart:async';

import '../entities/product.dart';

import '../dao/product_dao.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'technogadgetsdatabase.g.dart';

@Database(version: 1, entities: [ProductFloor])
abstract class TechnoGadgetsDatabase extends FloorDatabase {
  ProductDAO get productDAO;
}
