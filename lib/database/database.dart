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

  Future<void> DeleteClothes(int id)async{
   await(delete(clothes)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> Update(int id,String name,String desc,String typ,String cat,String img,int war) async{
    var updateClothes = Clothe(
        id: id,
        name: name,
        description: desc,
        category: cat,
        type: typ,
        warmth: war,
        imageUrl: img
    );
    await update(clothes).replace(updateClothes);
  }

  Future<void> warmthUpdate(ClothesInfo cl,int n)async{
    var updateClothes = Clothe(
        id:  cl.id,
        name: cl.name,
        type: cl.type,
        warmth: cl.warmth-n,
        category: cl.category,
        description: cl.description,
        imageUrl: cl.imageUrl);
    await update(clothes).replace(updateClothes);
  }

  Future<int> addClothesFromStrings(String name, String category, String type, String desc, String warm, String? imageUrl) {
    if (imageUrl == null || imageUrl == '') {
      imageUrl = 'https://gnel.am/images/product/8559/3ff6826f4711e054b45cd3112d2086e8.jpg';
    }
    return addClothes(ClothesCompanion(name: Value(name),
        category: Value(category),
        type: Value(type),
        description: Value(desc),
        warmth: Value(int.parse(warm)),
        imageUrl: Value(imageUrl),
    ));
  }

  Future<int> addClothes(ClothesCompanion entry) async {
    return into(clothes).insert(entry);
  }


  Future<List<ClothesInfo>> parseClotheToClothesInfo(Future<List<Clothe>> ll) async {
    var rr = await ll;
    return rr.map((cl) => ClothesInfo(cl.name, cl.category, cl.description,cl.warmth ,type: cl.type, imageUrl: cl.imageUrl, id: cl.id))
        .toList();
  }

  Future<List<Clothe>> getType(String type)
  {
    /// TO DO возвращать определенный тип
    return (select(clothes)..where((tbl) => tbl.type.equals(type))).get();
  }

  final Map<String, int> Warmth = {"Жилеты":5,"Куртки":10,"Плащи":10,"Пальто":10,"Пуховики":0,
    "Кофты":15,"Рубашки и блузки":20,"Пиджаки":20,"Майки и топы":30,"Худи и свитшоты":10,"Футболки и поло":25,"Джемперы и свитеры":15,
    "Трико":15,"Джинсы":10,"Брюки":15,"Шорты":25,"Юбки":15,
    "Шапки":0,"Зонты":-100,"Кепки":15,"Очки":-100,"Варежки":-1,"Перчатки":-10,
    "Кроссовки":10,"Ботинки":0,"Сапоги":0,"Туфли":10,"Сандали":30,"Сланцы":30
  };

   Future<List<Clothe>> getCategory(String category) async {
     return (select(clothes)..where((tbl) => tbl.category.equals(category))).get();
  }

  String ConvertTypeToWarm(String type){
    return Warmth[type].toString();
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