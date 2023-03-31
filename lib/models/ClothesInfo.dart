class ClothesInfo {
  String name;
  String category;
  String type;
  String description;
  String imageUrl;

  ClothesInfo(this.name, this.category,this.description, {this.type = '', this.imageUrl = 'https://gnel.am/images/product/8559/3ff6826f4711e054b45cd3112d2086e8.jpg'});

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

  @override
  String toString() {
    return '$name $category';
  }
}