import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikrayon/controllers/widget_controller.dart';
import 'package:vikrayon/utils/colors.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final ProductController controller = Get.find<ProductController>();
  final Map<String, RxDouble> itemQuantities = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: AppColors.colorlgs,
      ),
      body: Obx(
        () {
          final cartItems = controller.cartItems.values.toList();
          if (controller.isLoading.value) {
            return ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
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
                );
              },
            );
          }
          if (cartItems.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }

          for (var item in cartItems) {
            itemQuantities.putIfAbsent(item.id.toString(), () => 0.5.obs);
          }
          double totalPrice = 0;
          for (var item in cartItems) {
            double quantity = itemQuantities[item.id.toString()]?.value ?? 0.5;
            double discounted = item.price * (1 - item.discount / 100);
            totalPrice += discounted * quantity;
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    final discounted = item.price * (1 - item.discount / 100);
                    final quantity = itemQuantities[item.id.toString()]!;
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(12.sp),
                        leading: Image.network(
                          item.image,
                          width: 50,
                        ),
                        title: Text(item.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\$${discounted.toStringAsFixed(2)}'),
                            Obx(
                              () => Text(
                                "Qty: ${quantity.value.toStringAsFixed(1)}/kg",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Obx(
                              () => Text(
                                "Total: \$${(discounted * quantity.value).toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        trailing: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                if (quantity.value > 0.5) {
                                  quantity.value -= 0.5;
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                quantity.value += 0.5;
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Total Items: ${cartItems.length}'),
                    Text(
                      'Total Price (After discount): \$${totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Checkout',
                          content: Text(
                              'Total Price (After discount): \$${totalPrice.toStringAsFixed(2)}'),
                          textConfirm: "Proceed",
                          textCancel: "Cancel",
                          onConfirm: () {
                            Get.back();
                            Get.snackbar("sucess",
                                "Your order has been placed successfully");
                          },
                        );
                      },
                      icon: Icon(Icons.shopping_bag),
                      label: Text("Checkout"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorlgs,
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(
                              color: AppColors.colorlgs,
                              width: 2,
                            )),
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
