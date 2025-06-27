import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vikrayon/controllers/product_controller.dart';
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
            return _buildShimmerList();
          }
          if (cartItems.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }

          _initializeQuantites(cartItems);
          final double totalPrice = _calculateTotal(cartItems);
          return Column(
            children: [
              Expanded(
                child: _buildCartList(cartItems),
              ),
              _buildBottomCheckoutScetion(cartItems.length, totalPrice),
              _buildCheckoutButton(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildShimmerList() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: ListTile(
                      title: Container(
                    height: 20.sp,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ))));
        });
  }

  void _initializeQuantites(List<dynamic> cartItems) {
    for (var item in cartItems) {
      itemQuantities.putIfAbsent(item.id.toString(), () => 0.5.obs);
    }
  }

  double _calculateTotal(List<dynamic> cartItems) {
    double total = 0.0;
    for (var item in cartItems) {
      final quantity = itemQuantities[item.id.toString()]!;
      final discount = item.price * (1 - item.discount / 100);
      total += discount * quantity.value;
    }
    return total;
  }

  Widget _buildCartList(List<dynamic> cartItems) {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(cartItems[index].image, height: 50.h),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItems[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$${cartItems[index].price.toStringAsFixed(2)}'),
                  ],
                ),
              ),
              Obx(() => Text(
                    'Qty: ${itemQuantities[cartItems[index].id.toString()]!.value}',
                    style: const TextStyle(fontSize: 16),
                  )),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  final key = cartItems[index].id.toString();
                  if (itemQuantities[key]!.value > 0.5) {
                    itemQuantities[key]!.value -= 0.5;
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  final key = cartItems[index].id.toString();
                  itemQuantities[key]!.value += 0.5;
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget _buildCartTotal(List<dynamic> cartItems) {
  //   final total = _calculateTotal(cartItems);
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Column(
  //       children: [
  //         Text('Total Items: ${cartItems.length}'),
  //         Text(
  //           'Total Price (After discount): \$${total.toStringAsFixed(2)}',
  //           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildBottomCheckoutScetion(int itemCount, double totalPrice) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Total Items: $itemCount'),
          Text(
            'Total Price (After discount): \$${totalPrice.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.colorlgs,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // Add your logic here to handle the checkout button press
        },
        child: const Text('Checkout',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )));
  }
}
