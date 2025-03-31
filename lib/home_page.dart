import 'package:flutter/material.dart';
import 'package:shopping_app/global_variables.dart';
import 'package:shopping_app/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const ["All", "Addidas", "Nike", "Bata"];
  late String selectedFilter;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Shoes\nCollection",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final currentFilter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = currentFilter;
                        });
                      },
                      child: Chip(
                        side: BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1),
                        ),
                        backgroundColor:
                            selectedFilter == currentFilter
                                ? Theme.of(context).primaryColor
                                : Color.fromRGBO(245, 247, 249, 1),
                        label: Text(
                          currentFilter,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductCard(
                    title: product["title"] as String,
                    price: product["price"] as double,
                    image: product["imageURL"] as String,
                    backgroundColor:
                        index.isEven
                            ? const Color.fromRGBO(216, 240, 253, 1)
                            : const Color.fromRGBO(249, 247, 249, 1),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
