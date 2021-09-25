class Product {
  int? id, quantity;
  String? name, color, urlPhoto, size;
  double? price;
  bool? isAdded;

  Product({this.id, this.quantity, this.name, this.color, this.urlPhoto, this.price, this.isAdded});

  @override
  String toString() {
    return '${this.name}';
  }

  String toDescription() {
    return '${this.size} - ${this.color}';
  }
}