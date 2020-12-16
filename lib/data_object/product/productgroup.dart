class Productgroup
{
  String name;
  String head;

  Productgroup(this.name,this.head);
  Productgroup.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    head = json['head'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['head'] = this.head;
    return data;
  }
}