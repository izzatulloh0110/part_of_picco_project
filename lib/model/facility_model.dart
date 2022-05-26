class Facility {
  String name;
  bool isChecked;

  Facility({
    required this.name,
    this.isChecked = false,
  });
}

class Frame12 {
  String item;
  String image;

  Frame12({required this.image, required this.item});

  static List<Frame12> listFrame12 = [
    Frame12(image: "assets/images/kitchen_furniture.png", item: "Кухонный мебель"),
    Frame12(image: "assets/images/furniture.png", item: "Мебель в комнатах"),
    Frame12(image: "assets/images/fridge.png", item: "Холодильник"),
    Frame12(image: "assets/images/dishwasher.png", item: "Стиральная машина"),
    Frame12(image: "assets/images/tv.png", item: "Телевизор"),
    Frame12(image: "assets/images/wifi.png", item: "Internet"),
    Frame12(image: "assets/images/airconditioning.png", item: "Кондитционер"),
    Frame12(image: "assets/images/dishwasher.png", item: "Посудамойка"),
    Frame12(image: "assets/images/bedroom.png", item: "Душевая кабина"),
    Frame12(image: "assets/images/baby.png", item: "Можно с детми"),
    Frame12(image: "assets/images/animals.png", item: "Можно с животнымиь"),
  ];
}
