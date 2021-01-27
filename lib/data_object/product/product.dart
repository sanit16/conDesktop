class Product {
  String description;
  String detail;
  String group;
  String head;
  String image;
  String name;
  dynamic  price;
  dynamic  stock;
  String qrcode;
  dynamic  star;
  dynamic  sold;
  bool delivery;
  DateTime updatedate;


  Product(
      this.description,
      this.detail,
      this.group,
      this.head,
      this.image,
      this.name,
      this.price,
      this.stock,
      this.qrcode,
      this.star,
      this.sold,
      this.delivery,
      this.updatedate);

  Product.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    detail = json['detail'];
    group = json['group'];
    head = json['head'];
    image = json['image'];
    name = json['name'];
    price =  json['price'].toDouble();
    qrcode = json['qrcode'];
    stock = 0.0;
    star = 0.0;
    sold = 0.0;
    delivery = true;
    updatedate = DateTime.now();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['detail'] = this.detail;
    data['group'] = this.group;
    data['head'] = this.head;
    data['image'] = this.image;
    data['name'] = this.name;
    data['price'] = this.price;
    data['qrcode'] = this.qrcode;
    data['stock'] = this.stock;
    data['star'] = this.star;
    data['sold'] = this.sold;
    data['delivery'] = this.delivery;
    data['updatedate'] = this.updatedate;
    return data;
  }


}
