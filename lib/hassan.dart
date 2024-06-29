class hassan {
  hassan({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.rate,
    required this.kcal,
    required this.cookingTime,
    required this.description,
  });

  String id;
  String image;
  String name;
  int price;
  double rate;
  String kcal;
  String cookingTime;
  String description;
}

final dummyFoods = [
  hassan(
    id: '1',
    image: 'asset/burger.jpeg',
    name: 'Burger Cheese',
    price: 15,
    rate: 4.5,
    kcal: '100',
    cookingTime: '20 Min',
    description: 'This is Burger For Hassan',
  ),
  hassan(
    id: '2',
    image: 'asset/pizza.jpeg',
    name: 'Pizza Hots',
    price: 20,
    rate: 4.5,
    kcal: '100',
    cookingTime: '30 Min',
    description: 'Pizza Hassan .',
  ),
  hassan(
    id: '3',
    image: 'asset/salad.webp',
    name: 'Salad ',
    price: 10,
    rate: 4,
    kcal: '20',
    cookingTime: '15 Min',
    description: 'Salade Free',
  ),
  hassan(
    id: '4',
    image: 'asset/salmon.jpeg',
    name: 'Salmon Fresh Mounth',
    price: 12,
    rate: 4.8,
    kcal: '60',
    cookingTime: '18 Min',
    description: 'Good Hassan',
  ),
];
