class BaseOption {

  String name;
  String value;
  String meta;
  double price;

  BaseOption(this.name, this.value, this.meta, this.price);

  BaseOption.fromJson( Map<String,dynamic> jsonObject ){
    this.name = jsonObject['name'];
    this.value = jsonObject['value'];
    this.meta = jsonObject['meta'];
    this.price = jsonObject['price'];
  }
}