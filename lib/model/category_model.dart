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
List<CategoryModel> categoriesGrid = [
  CategoryModel(
    name: "Nashville",
    fullname: "Nashville armchair",
    imageurl: "chair_1.png",
    type: 'chair',
    price: '\$165.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "chair_1": ["chair_1.png", "chair_1_1.png", "chair_1_2.png"],
      "chair_0": ["chair_0.png", "chair_0_1.png", "chair_0_2.png"],
      "chair_2": [
        "chair_2.png",
        "chair_2_1.png",
        "chair_2_2.png",
        "chair_2_3.png",
        "chair_2_4.png"
      ],
    },
  ),
  CategoryModel(
    name: "Tripod lamp",
    fullname: "Tripod lamp",
    imageurl: "tripod_lamp_1.png",
    type: 'Tripod_lamp',
    price: '\$1520.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "tripod_lamp_1": ["tripod_lamp_1.png"],
      "tripod_lamp_2": ["tripod_lamp_2.png"],
      "tripod_lamp_3": ["tripod_lamp_3.png"],
    },
  ),
  CategoryModel(
    name: "Floor lamp",
    fullname: "Floor lamp",
    imageurl: "floor_lamp_1.png",
    type: 'floor_lamp',
    price: '\$5520.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "floor_lamp_1": ["floor_lamp_1.png"],
      "floor_lamp_2": ["floor_lamp_2.png"],
      "floor_lamp_3": ["floor_lamp_3.png"],
    },
  ),
  CategoryModel(
    name: "Sofa",
    fullname: "Sofa sate",
    imageurl: "sofa_1.png",
    type: 'Sofa',
    price: '\$125.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "sofa_1": ["sofa_1.png"],
      "sofa_2": ["sofa_2.png"],
      "sofa_3": ["sofa_3.png"],
      "sofa_4": ["sofa_4.png"],
    },
  ),
  CategoryModel(
    name: "Table",
    fullname: "Chiavari chair",
    imageurl: "img_1.png",
    type: 'Chiavari_chair',
    price: '\$1350.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "Chiavari_chair": ["img_1.png"],
    },
  ),
  CategoryModel(
    name: "Revolving",
    fullname: "Chiavari chair",
    imageurl: "img_2.png",
    type: 'Chiavari_chair',
    price: '\$1050.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "Chiavari_chair": ["img_2.png"],
    },
  ),
  CategoryModel(
    name: "Recilner",
    fullname: "Chiavari chair",
    imageurl: "img_4.png",
    type: 'Chiavari_chair',
    price: '\$1950.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "Chiavari_chair": ["img_4.png"],
    },
  ),
  CategoryModel(
    name: "Lounge",
    fullname: "Chiavari chair",
    imageurl: "img_6.png",
    type: 'Chiavari_chair',
    price: '\$550.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "Chiavari_chair": ["img_6.png"],
    },
  ),
  CategoryModel(
    name: "Bistor Chair",
    fullname: "Chiavari chair",
    imageurl: "img_13.png",
    type: 'Chiavari_chair',
    price: '\$4550.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "Chiavari_chair": ["img_13.png"],
    },
  ),
  CategoryModel(
    name: "Sofa",
    fullname: "Chiavari chair",
    imageurl: "sofa.1_.png",
    type: 'Chiavari_chair',
    price: '\$3550.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "Chiavari_chair": ["sofa.1_.png"],
    },
  ),
  CategoryModel(
    name: "Club",
    fullname: "Club chair",
    imageurl: "123.png",
    type: 'Club_chair',
    price: '\$350.00',
    description: "A contemporary twist classic mid-century modern design",
    differentImageurl: {
      "Chiavari_chair": ["123.png"],
    },
  ),
];
