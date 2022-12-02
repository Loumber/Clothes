class ClothesInfo {
  String name;
  String category;
  String description;

  ClothesInfo(this.name, this.category, this.description);

  bool contains(String query) {
    return (name.contains(query)) || (category.contains(query));
  }
}