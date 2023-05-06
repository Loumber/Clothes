class ClothesInfo {
  int id;
  String name;
  String category;
  String type;
  String description;
  String imageUrl;
  int warmth;
  ClothesInfo(this.name, this.category,this.description, this.warmth,{this.type = '', required this.imageUrl, required this.id});

  bool contains(String query) {
    return (name.contains(query)) || (category.contains(query));
  }

  String GetName() {
    return this.name;
  }
  String GetCategory() {
    return this.category;
  }
  String GetType() {
    return this.type;
  }
  String GetDescription() {
    return this.description;
  }
  int GetWarmth(){
    return this.warmth;
  }


  @override
  String toString() {
    return '$name $category';
  }
}