class ProductModel {
  final int id;
  final String title ;
  final String description;
  final String imgurl;
  final num price;
  ProductModel(  {
     required this.id,required this.title,required this.description,required this.imgurl,required this.price,
}
);
  factory ProductModel.fromJson(Map<String,dynamic>json)
  {
    return ProductModel(
        id:json['id'],
        title:json['title'],
        description:json['description'],
        imgurl:json['thumbnail'],
        price:json['price']
    );
  }

}