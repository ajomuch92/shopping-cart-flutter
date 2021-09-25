import 'package:shopping_cart_flutter/models/Product.dart';
import 'dart:math';

List<String> _items = ['Cuaderno', 'Lápiz carbón', 'Lápiz tinta', 'Cuaderno espiral', 'Borrador', 'Regla', 'Diccionario', 'Memorias USB'];
List<String> _urls = ['https://image.freepik.com/psd-gratis/maqueta-cuaderno-cinta_7838-391.jpg', 'https://image.freepik.com/vector-gratis/diseno-lapiz-escribiendo_1095-187.jpg', 'https://image.freepik.com/psd-gratis/mockup-boligrafo-merchandising_23-2148154205.jpg', 'https://image.freepik.com/psd-gratis/plantilla-maqueta-cuaderno-anillado_1051-2872.jpg', 'https://image.freepik.com/foto-gratis/eliminar-cancelar-cortar-eliminar-borrar-editar_53876-132168.jpg', 'https://image.freepik.com/vector-gratis/diseno-proyectos-arquitectura_24877-49746.jpg', 'https://image.freepik.com/foto-gratis/libro-biblioteca-libro-texto-abierto_1150-5924.jpg', 'https://image.freepik.com/psd-gratis/mockup-pen-drive-merchandising_23-2148154200.jpg'];
List<String> _colors = ['Rojo', 'Amarillo', 'Azul', 'Verde', 'Naranja'];
List<String> _sizes = ['Extra grande', 'Grande ', 'Mediano', 'Pequeño'];

List<Product> getRandomProductList({int numberOfItems = 100}) {
  List<Product> list = [];
  Random _rn = Random();
  for(int i = 0; i < numberOfItems; i++) {
    Product _product = Product();
    int _randomItemIndex = _rn.nextInt(_items.length);
    int _randomColorIndex = _rn.nextInt(_colors.length);
    int _randomSizeIndex = _rn.nextInt(_sizes.length);
    _product.name = _items[_randomItemIndex];
    _product.urlPhoto = _urls[_randomItemIndex];
    _product.color = _colors[_randomColorIndex];
    _product.size = _sizes[_randomSizeIndex];
    list.add(_product);
  }
  return list;
}