import './technogadgetsdatabase.dart';

class DatabaseInstance {
  static DatabaseInstance? _instance;

  DatabaseInstance._();
  static DatabaseInstance get instance => _instance ??= DatabaseInstance._();

  Future<TechnoGadgetsDatabase> getDatabaseInstance() {
    return $FloorTechnoGadgetsDatabase.databaseBuilder('techno_gadgets_db').build();
  }
}
