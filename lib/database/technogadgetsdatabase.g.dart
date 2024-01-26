// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'technogadgetsdatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorTechnoGadgetsDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TechnoGadgetsDatabaseBuilder databaseBuilder(String name) =>
      _$TechnoGadgetsDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TechnoGadgetsDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$TechnoGadgetsDatabaseBuilder(null);
}

class _$TechnoGadgetsDatabaseBuilder {
  _$TechnoGadgetsDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$TechnoGadgetsDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$TechnoGadgetsDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<TechnoGadgetsDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TechnoGadgetsDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TechnoGadgetsDatabase extends TechnoGadgetsDatabase {
  _$TechnoGadgetsDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ProductDAO? _productDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProductFloor` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `productId` TEXT, `name` TEXT, `quantity` INTEGER, `imageUrl` TEXT, `category` TEXT, `price` REAL, `description` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ProductDAO get productDAO {
    return _productDAOInstance ??= _$ProductDAO(database, changeListener);
  }
}

class _$ProductDAO extends ProductDAO {
  _$ProductDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _productFloorInsertionAdapter = InsertionAdapter(
            database,
            'ProductFloor',
            (ProductFloor item) => <String, Object?>{
                  'id': item.id,
                  'productId': item.productId,
                  'name': item.name,
                  'quantity': item.quantity,
                  'imageUrl': item.imageUrl,
                  'category': item.category,
                  'price': item.price,
                  'description': item.description
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProductFloor> _productFloorInsertionAdapter;

  @override
  Future<List<ProductFloor?>> getAllMobiles() async {
    return _queryAdapter.queryList(
        'select DISTINCT name,description,price from productfloor',
        mapper: (Map<String, Object?> row) => ProductFloor(
            productId: row['productId'] as String?,
            name: row['name'] as String?,
            quantity: row['quantity'] as int?,
            imageUrl: row['imageUrl'] as String?,
            category: row['category'] as String?,
            price: row['price'] as double?,
            description: row['description'] as String?));
  }

  @override
  Future<void> dropTable() async {
    await _queryAdapter
        .queryNoReturn('DROP TABLE IF EXISTS [dbo].[productfloor]');
  }

  @override
  Future<void> insertSpot(ProductFloor product) async {
    await _productFloorInsertionAdapter.insert(
        product, OnConflictStrategy.abort);
  }
  
  Future<List<ProductFloor?>> getAllMobile() {
    // ignore: todo
    // TODO: implement getAllMobiles
    throw UnimplementedError();
  }
}
