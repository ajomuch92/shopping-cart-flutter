class Product {
  int? id, quantity;
  String? name, color, urlPhoto, size;
  double? price;
  bool? isAdded;

  Product({this.id, this.quantity, this.name, this.color, this.urlPhoto, this.price, this.isAdded, this.size});

  @override
  String toString() {
    return '${this.name}';
  }

  String toDescription() {
    return '${this.size} ${this.color} ${this.quantity} #items';
  }

  Product clone() {
    return Product(
      id: this.id, quantity: this.quantity, name: this.name, color: this.color, urlPhoto: this.urlPhoto, price: this.price, isAdded: this.isAdded, size: this.size
    );
  }
}