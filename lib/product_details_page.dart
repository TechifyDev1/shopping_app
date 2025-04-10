import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.product["title"] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product["imageURL"] as String),
          ),
          Spacer(flex: 2),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            width: double.infinity,
            height: 250,
            child: Column(
              children: [
                Text(
                  "\$${(widget.product["price"] as double).toStringAsFixed(2)}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    itemCount: (widget.product["sizes"] as List<int>).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product["sizes"] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap:
                              () => setState(() {
                                selectedSize = size;
                              }),
                          child: Chip(
                            label: Text(size.toString()),
                            backgroundColor:
                                selectedSize == size
                                    ? Theme.of(context).primaryColor
                                    : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedSize != 0) {
                        Provider.of<CartProvider>(
                          listen: false,
                          context,
                        ).addProductToCart({
                          "id": widget.product["id"],
                          "title": widget.product["title"],
                          "imageURL": widget.product["imageURL"],
                          "size": selectedSize,
                          "price": widget.product["price"],
                          "company": widget.product["company"],
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Added to cart")),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Please select a size")),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
