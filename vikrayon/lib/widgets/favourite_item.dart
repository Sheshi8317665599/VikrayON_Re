import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';
import 'package:vikrayon/controllers/widget_controller.dart';
import 'package:vikrayon/utils/colors.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({super.key});

  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  final ProductController controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Item'),
        backgroundColor: AppColors.colorlgs,
      ),
      body: Obx(
        () {
          final favProducts = controller.products
              .where((p) => controller.isFavourite(p.id))
              .toList();
          if (controller.isLoading.value) {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            );
          }

          if (favProducts.isEmpty) {
            return const Center(
              child: Text('No Favourite Items'),
            );
          }

          double totalDiscounted = 0;
          for (var p in favProducts) {
            totalDiscounted += p.price * (1 - p.discount / 100);
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: favProducts.length,
                  itemBuilder: (context, index) {
                    final product = favProducts[index];
                    final discounted =
                        product.price * (1 - product.discount / 100);

                    return ListTile(
                      leading: Image.network(product.image, width: 50),
                      title: Text(product.name),
                      subtitle: Text('\$${discounted.toStringAsFixed(2)}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () =>
                                controller.toogleFavourite(product.id),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_shopping_cart,
                                color: Colors.green),
                            onPressed: () {
                              controller.addToCart(product);
                              Get.snackbar(
                                  'Success', '${product.name} added to cart',
                                  snackPosition: SnackPosition.BOTTOM);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Favourtie Items: ${favProducts.length}'),
                    Text(
                      'Total Value (after discont) : \$${totalDiscounted.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        for (var product in favProducts) {
                          controller.addToCart(product);
                        }
                        Get.snackbar('Success', 'All items added to cart',
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.colorlgs,
                      ),
                      label: const Text('Add All to Cart'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorlgs,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(
                            color: AppColors.colorlgs,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
