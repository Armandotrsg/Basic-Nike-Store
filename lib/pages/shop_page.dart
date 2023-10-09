import 'package:e_commerce/components/shoe_tile.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final TextEditingController _searchController = TextEditingController();

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // * Alert Dialog
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Successfully added to cart"),
              content: Text(
                "${shoe.name} was added to your cart",
                textAlign: TextAlign.center,
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                // * Search bar
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12), // Adjust the vertical padding
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Add a TextField widget to allow the user to enter text
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                          onChanged: (text) {
                            // Call setState to update the UI with the entered text
                            setState(() {});
                          },
                        ),
                      ),
                      const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                // * Message
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    "Everyone flies... some fly longer than others",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),

                // * Hot Picks
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hot Picks 🔥",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text("See all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue)),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Expanded(
                  child: ListView.builder(
                    itemCount: value.getShoeShop().length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      // * Get shoe
                      Shoe shoe = value.getShoeShop()[index];
                      if (_searchController.text.isNotEmpty &&
                          !shoe.name
                              .toLowerCase()
                              .contains(_searchController.text.toLowerCase())) {
                        return const SizedBox.shrink();
                      } else {
                        return ShoeTile(
                          shoe: shoe,
                          onTap: () => addShoeToCart(shoe),
                        );
                      }
                    },
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: Divider(
                    color: Colors.white,
                  ),
                )
              ],
            ));
  }
}
