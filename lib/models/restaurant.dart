import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/cart_item.dart';
import 'package:food_app/models/foods.dart';
import 'package:intl/intl.dart';


class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    //burgers
    Food(
      name: 'Cheese Burger',
      description: 'A juicy flat burger melted with cheese',
      imagePath: 'lib/images/burgers/Cheeseburger.jpg',
      price: 1.90,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Extra Cheese', price: 1.2),
      ],
    ),
    Food(
      name: 'Veggie Burger',
      description: 'Grilled veggie patty with avocado and sprouts',
      imagePath: 'lib/images/burgers/Cheeseburger.jpg',
      price: 2.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: 'Guacamole', price: 1.5),
        Addon(name: 'Cheese', price: 1.0),
      ],
    ),
    // More food items for other categories
    Food(
      name: 'Caesar Salad',
      description: 'Fresh romaine lettuce with Caesar dressing and croutons',
      imagePath: 'lib/images/salads/salad.jpeg',
      price: 3.75,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.0),
        Addon(name: 'Shrimp', price: 3.0),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description:
          'Crisp lettuce, tomatoes, cucumbers, olives, and feta cheese',
      imagePath: 'lib/images/salads/salad.jpeg',
      price: 4.25,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: 'Grilled Chicken', price: 2.0),
        Addon(name: 'Extra Feta', price: 1.0),
      ],
    ),
    // More food items for other categories
    Food(
      name: 'French Fries',
      description: 'Crispy golden fries served with ketchup',
      imagePath: 'lib/images/sides/sides.jpeg',
      price: 2.00,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    Food(
      name: 'Onion Rings',
      description: 'Deep-fried battered onion rings served with dipping sauce',
      imagePath: 'lib/images/sides/sides.jpeg',
      price: 2.50,
      category: FoodCategory.sides,
      availableAddons: [],
    ),
    // More food items for other categories
    Food(
      name: 'Chocolate Cake',
      description: 'Decadent chocolate cake with rich chocolate frosting',
      imagePath: 'lib/images/dessert/dessert.jpg',
      price: 3.99,
      category: FoodCategory.dessert,
      availableAddons: [],
    ),
    Food(
      name: 'Cheesecake',
      description: 'Creamy cheesecake with a graham cracker crust',
      imagePath: 'lib/images/dessert/dessert.jpg',
      price: 4.50,
      category: FoodCategory.dessert,
      availableAddons: [],
    ),
    // More food items for other categories
    Food(
      name: 'Coke',
      description: 'Refreshing Coca-Cola soda',
      imagePath: 'lib/images/drinks/drinks.jpg',
      price: 1.25,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
    Food(
      name: 'Iced Tea',
      description: 'Chilled black tea with a hint of lemon',
      imagePath: 'lib/images/drinks/drinks.jpg',
      price: 1.50,
      category: FoodCategory.drinks,
      availableAddons: [],
    ),
  ];

  /*

  G E T T E R S

   */

  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  //user cart
  final List<CartItem> _cart = [];

  /*


  
  
  O P E R A T I O N S
  
   */

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    //if item is already exists, increase it's quantity

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    notifyListeners();
  }

  //remove from cart

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }

    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //get total numbers of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /* 
  
  H E L P E R S

  */

  //generate a reciept
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();

    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-------");

    for(final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if(cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();

  }

  //format double value into money
  String _formatPrice(double price) {
    return "\$ ${price.toStringAsFixed(2)}";
  }

  //format list of addons  into string summmary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(",");
  }
}
