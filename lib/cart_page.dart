import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    return Scaffold(
      appBar: AppBar(title: const Text("Cart Page")),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Delete Product",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: const Text(
                        "Are you sure you want to delete this product?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            Provider.of<CartProvider>(
                              context,
                              listen: false,
                            ).removeProductFromCart(cartItem);
                            context.read();
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },

              icon: const Icon(Icons.delete, color: Colors.red),
            ),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(cartItem["imageURL"].toString()),
            ),
            title: Text(
              cartItem["title"].toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text("Size: ${cartItem["size"].toString()}"),
          );
        },
      ),
    );
  }
}
