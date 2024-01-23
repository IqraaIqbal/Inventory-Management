class Product {
  int pid;
  String productName;
  double itemsIn;
  double itemsOut;

  Product({required this.pid, required this.productName, required this.itemsIn, required this.itemsOut});

  double get remainingItems => itemsIn - itemsOut;
}

class Store {
  String storeName;

  Store({required this.storeName});

}