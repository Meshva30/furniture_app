class CategoryModel {
  String imageurl, name, price, type, fullname, description;
  Map<String, List<String>> differentImageurl;

  CategoryModel({
    required this.imageurl,
    required this.name,
    required this.price,
    required this.type,
    required this.fullname,
    required this.description,
    required this.differentImageurl,
  });
}
