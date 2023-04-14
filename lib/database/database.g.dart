// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ClothesTable extends Clothes with TableInfo<$ClothesTable, Clothe> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClothesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _warmthMeta = const VerificationMeta('warmth');
  @override
  late final GeneratedColumn<int> warmth = GeneratedColumn<int>(
      'warmth', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 30),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, type, warmth, category, description, imageUrl];
  @override
  String get aliasedName => _alias ?? 'clothes';
  @override
  String get actualTableName => 'clothes';
  @override
  VerificationContext validateIntegrity(Insertable<Clothe> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('warmth')) {
      context.handle(_warmthMeta,
          warmth.isAcceptableOrUnknown(data['warmth']!, _warmthMeta));
    } else if (isInserting) {
      context.missing(_warmthMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Clothe map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Clothe(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      warmth: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}warmth'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
    );
  }

  @override
  $ClothesTable createAlias(String alias) {
    return $ClothesTable(attachedDatabase, alias);
  }
}

class Clothe extends DataClass implements Insertable<Clothe> {
  final int id;
  final String name;
  final String type;
  final int warmth;
  final String category;
  final String description;
  final String imageUrl;
  const Clothe(
      {required this.id,
      required this.name,
      required this.type,
      required this.warmth,
      required this.category,
      required this.description,
      required this.imageUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['warmth'] = Variable<int>(warmth);
    map['category'] = Variable<String>(category);
    map['description'] = Variable<String>(description);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  ClothesCompanion toCompanion(bool nullToAbsent) {
    return ClothesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      warmth: Value(warmth),
      category: Value(category),
      description: Value(description),
      imageUrl: Value(imageUrl),
    );
  }

  factory Clothe.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Clothe(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      warmth: serializer.fromJson<int>(json['warmth']),
      category: serializer.fromJson<String>(json['category']),
      description: serializer.fromJson<String>(json['description']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'warmth': serializer.toJson<int>(warmth),
      'category': serializer.toJson<String>(category),
      'description': serializer.toJson<String>(description),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  Clothe copyWith(
          {int? id,
          String? name,
          String? type,
          int? warmth,
          String? category,
          String? description,
          String? imageUrl}) =>
      Clothe(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        warmth: warmth ?? this.warmth,
        category: category ?? this.category,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
      );
  @override
  String toString() {
    return (StringBuffer('Clothe(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('warmth: $warmth, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, type, warmth, category, description, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Clothe &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.warmth == this.warmth &&
          other.category == this.category &&
          other.description == this.description &&
          other.imageUrl == this.imageUrl);
}

class ClothesCompanion extends UpdateCompanion<Clothe> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<int> warmth;
  final Value<String> category;
  final Value<String> description;
  final Value<String> imageUrl;
  const ClothesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.warmth = const Value.absent(),
    this.category = const Value.absent(),
    this.description = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  ClothesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    required int warmth,
    required String category,
    required String description,
    required String imageUrl,
  })  : name = Value(name),
        type = Value(type),
        warmth = Value(warmth),
        category = Value(category),
        description = Value(description),
        imageUrl = Value(imageUrl);
  static Insertable<Clothe> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? warmth,
    Expression<String>? category,
    Expression<String>? description,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (warmth != null) 'warmth': warmth,
      if (category != null) 'category': category,
      if (description != null) 'description': description,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  ClothesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? type,
      Value<int>? warmth,
      Value<String>? category,
      Value<String>? description,
      Value<String>? imageUrl}) {
    return ClothesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      warmth: warmth ?? this.warmth,
      category: category ?? this.category,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (warmth.present) {
      map['warmth'] = Variable<int>(warmth.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClothesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('warmth: $warmth, ')
          ..write('category: $category, ')
          ..write('description: $description, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $ClothesTable clothes = $ClothesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [clothes];
}
