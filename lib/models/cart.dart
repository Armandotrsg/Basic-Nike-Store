import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        name: "Air Jordan",
        price: "236",
        imagePath: "assets/images/jordan-1.webp",
        description: "Amazing Jordan"),
    Shoe(
        name: "Air Jordan Max",
        price: "240",
        imagePath: "assets/images/jordan-2.webp",
        description: "Cool Jordan"),
    Shoe(
        name: "Air Jordan 3",
        price: "250",
        imagePath: "assets/images/jordan-3.webp",
        description: "Nice Jordan"),
  ];

  List<Shoe> userCart = [];

  //Get shop
  List<Shoe> getShoeShop() {
    return shoeShop;
  }
  
  //Get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //Add to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //Remove 
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
