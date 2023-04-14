import 'dart:io';
import 'package:clothes/database/clothes.dart';
import 'package:drift/drift.dart';
// These imports are used to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../models/ClothesInfo.dart';

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

  Future<int> addClothesFromStrings(String name, String category, String type, String desc, String warm) {
    return addClothes(ClothesCompanion(name: Value(name),
        category: Value(category),
        type: Value(type),
        description: Value(desc),
        warmth: Value(int.parse(warm)),
        //imageUrl: Value(imageUrl)
    ));
  }

  Future<int> addClothes(ClothesCompanion entry) async {
    return into(clothes).insert(entry);
  }


  Future<List<ClothesInfo>> parseClotheToClothesInfo(Future<List<Clothe>> ll) async {
    var rr = await ll;
    return rr.map((cl) => ClothesInfo(cl.name, cl.category, cl.description,cl.warmth ,type: cl.type))
        .toList();
  }

  Future<List<Clothe>> getType(String type)
  {
    /// TO DO возвращать определенный тип
    return (select(clothes)..where((tbl) => tbl.type.equals(type))).get();
  }

  final Map<String, int> Warmth = {"Жилеты":0,"Куртки":0,"Плащи":0,"Пальто":0,"Пуховики":0,
    "Кофты":0,"Рубашки и блузки":0,"Пиджаки":0,"Майки и топы":0,"Худи и свитшоты":0,"Футболки и поло":0,"Джемперы и свитеры":0,
    "Трико":0,"Джинсы":0,"Брюки":0,"Шорты":0,"Юбки":0,
    "Шапки":0,"Зонты":0,"Кепки":0,"Очки":0,"Варежки":0,"Перчатки":0,
    "Кроссовки":0,"Ботинки":0,"Сапоги":0,"Туфли":0,"Сандали":0,"Сланцы":0
  };

   Future<List<Clothe>> getCategory(String category) async {
     return (select(clothes)..where((tbl) => tbl.type.equals(category))).get();
  }

  String ConvertTypeToWarm(String type){
    return Warmth[type] as String;
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