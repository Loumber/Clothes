class ClothesInfo {
  String name;
  String category;
  String type;
  String description;

  ClothesInfo(this.name, this.category,this.description, {this.type = ''});

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
}