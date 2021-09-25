void main() {
  ShoppingCart.withCode(name: "rome", code: '12345')
    ..booking = [Item('a', 10.0), Item('b', 20.0)]
    ..printInfo();
}

abstract class PrintHelper {
  printInfo() => print(getInfo());
  getInfo();
}

class Meta {
  String name;
  double price;
  Meta(this.name, this.price);
}

class Item extends Meta {
  Item(name, price) : super(name, price);
  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

class ShoppingCart extends Meta with PrintHelper {
  DateTime date;
  List<Item> booking = [];
  String? code;

  ShoppingCart({name}) : this.withCode(name: name, code: null);

  ShoppingCart.withCode({name, this.code})
      : date = DateTime.now(),
        super(name, 0);

  double get price => booking.reduce((value, elem) => value + elem).price;

  getInfo() {
    // return '购物车信息：' +
    //     '\n----------------' +
    //     '\n用户名：' +
    //     name +
    //     '\n优惠吗：' +
    //     code +
    //     '\n总价：' +
    //     price.toString() +
    //     '\n日期：' +
    //     date.toString() +
    //     '\n-----------------';
    return '''
    购物车信息：
    --------------------
    用户名：$name
    优惠码: $code
    总价： $price
    Date: $date
    --------------------
    ''';
  }
}
