import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_flutter/components/grocery_item_tile.dart';
import 'package:online_shop_flutter/components/nav_bottom.dart';
import 'package:online_shop_flutter/models/cart_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(179, 234, 234, 234),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 430, maxHeight: 932),
            child: Container(
              decoration: BoxDecoration(color: Color(0xFFF1F5F9)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 48),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Good Morning',
                      style: GoogleFonts.poppins(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Time to treat yourself with fresh fruit!',
                      style: GoogleFonts.notoSerif(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Divider(color: Colors.grey),
                  ),

                  SizedBox(height: 24),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      'Fresh fruit',
                      style: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ),

                  SizedBox(height: 10),

                  Expanded(
                    child: Consumer<CartModel>(
                      builder: (context, value, child) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1 / 1.3,
                              ),
                          itemCount: value.shopItems.length,
                          padding: EdgeInsets.all(12),
                          itemBuilder: (BuildContext context, int index) {
                            return GroceryItemTile(
                              name: value.shopItems[index][0],
                              price: value.shopItems[index][1],
                              imageUrl: value.shopItems[index][2],
                              color: value.shopItems[index][3],
                              onPressed: () {
                                Provider.of<CartModel>(
                                  context,
                                  listen: false,
                                ).addItemToCard(index);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 4),
                  Center(child: NavBottom()),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
