class ProductSimple {
  String description;
  String detail;
  String group;
  String head;
  String image;
  String name;
  String price;
  int qrcode;
  double star;
  bool delivery;
  String updatedate;
  ProductSimple(
      {this.description,
        this.detail,
        this.group,
        this.head,
        this.image,
        this.name,
        this.price});

  ProductSimple.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    detail = json['detail'];
    group = json['group'];
    head = json['head'];
    image = json['image'];
    name = json['name'];
    price = json['price'];
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
    return data;
  }
}
