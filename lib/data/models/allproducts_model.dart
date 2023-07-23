class AllProducts_Model {
  int? status;
  String? message;
  List<AllProducts_Data> allProducts_Data =[];

  AllProducts_Model.fromJson({required Map<String,dynamic> json}){
    status = json['status'];
    message = json['message'];
    json['products'].forEach((element){
      AllProducts_Data item = AllProducts_Data.fromJson(json: element);
      allProducts_Data.add(item);
    });
  }

}

class AllProducts_Data {
  int? id;
  String? company;
  String? name;
  String? type;
  String? price;
  String? image;
  String? description;

  AllProducts_Data.fromJson({required Map<String, dynamic> json}) {
    id=json['id'];
    company = json['company'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    description = json['description'];



  }
}
