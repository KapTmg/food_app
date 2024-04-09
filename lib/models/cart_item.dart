
import 'package:food_app/models/foods.dart';

class CartItem {
  Food food;
  List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.food,
    required this.selectedAddons,
   this.quantity = 1,
  });

  double get totalPrice {
    double addonPrices = selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (food.price + addonPrices) * quantity;
  }
}
