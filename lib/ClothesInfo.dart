class ClothesInfo {
  String name;
  String category;
  String type;
  String description;
  String imageUrl;

  ClothesInfo(this.name, this.category,this.description, {this.type = '', this.imageUrl = 'https://yandex.ru/images/search?rpt=simage&noreask=1&source=qa&text=Адриано+Челентано&stype=image&lr=39&parent-reqid=1676047020532346-17112497035958590208-vla1-5154-vla-l7-balancer-8080-BAL-4947'});

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