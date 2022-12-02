import 'dart:io';
import 'package:clothes/database/clothes.dart';
import 'package:drift/drift.dart';
// These imports are used to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(
  // relative import for the drift file. Drift also supports `package:`
  // imports
  tables: [Clothes],
  include: {'clothes.dart'},
)


class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());
  Future<List<Clothe>> get allClotheEntries => select(clothes).get();

  Future<int> addClothesFromStrings(String name, String category, String type, String desc) {
    return addClothes(ClothesCompanion(name: Value(name),
        category: Value(category),
        type: Value(type),
        description: Value(desc)
    ));
  }

  Future<int> addClothes(ClothesCompanion entry) async {
    return into(clothes).insert(entry);
  }

  Future<List<Clothe>> getCategory(String category) async {
    return await (select(clothes)..where((tbl) => tbl.category.equals(category))).get();
  }

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}