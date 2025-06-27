import 'package:flutter/material.dart';
import 'package:flutter_product_card/flutter_product_card.dart';
import 'package:flutter_product_carousel/flutter_product_carousel.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 400,
            width: 300,
            child: ProductCard(
              imageUrl: 'https://shorturl.at/oxA34',
              categoryName: 'Pants',
              productName: 'Men Linen Pants',
              price: 199.99,
              currency: '\$', // Default is '$'
              onTap: () {
                // Handle card tap event
              },
              onFavoritePressed: () {
                // Handle favorite button press
              },
              shortDescription:
                  'comfortable & airy.', // Optional short description
              rating: 4.2, // Optional rating
              discountPercentage: 35.0, // Optional discount percentage
              isAvailable: true, // Optional availability status
              cardColor: Colors.white, // Optional card background color
              textColor: Colors.black, // Optional text color
              borderRadius: 8.0, // Optional border radius
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCarouselTest extends StatefulWidget {
  const ProductCarouselTest({super.key});

  @override
  State<ProductCarouselTest> createState() => _ProductCarouselTestState();
}

class _ProductCarouselTestState extends State<ProductCarouselTest> {
  final ProductCarouselController _productCarouselController =
      ProductCarouselController();
  bool preView = false;

  int currentPage = 0;
  bool isFavorite = false;

  List<ImageProvider> imageList = <ImageProvider>[];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => updateImageList(context),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Carousel'), elevation: 2),
      body: ProductCarousel(
        imagesList: const [
          'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482435/A_vibrant_and_immersive_virtual_reality_VR_scene_Small_pyawsi.png',
          'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482435/A_vibrant_and_immersive_virtual_reality_VR_scene_Small_pyawsi.png',
          'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482435/A_vibrant_and_immersive_virtual_reality_VR_scene_Small_pyawsi.png',
          'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482435/A_vibrant_and_immersive_virtual_reality_VR_scene_Small_pyawsi.png',
          'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482435/A_vibrant_and_immersive_virtual_reality_VR_scene_Small_pyawsi.png',
          'https://res.cloudinary.com/ddlyhla10/image/upload/v1749482435/A_vibrant_and_immersive_virtual_reality_VR_scene_Small_pyawsi.png',
        ],
        multiImagesList: imageList,
        carouselOptions: ProductCarouselOptions(
          autoPlay: true,
          aspectRatio: 10 / 9,
          productCarouselController: _productCarouselController,
          showNavigationIcons: true,
          enabledInfiniteScroll: true,
          isFavorite: isFavorite,
          previewImages: preView,
          onTap: () {
            setState(() {
              preView = !preView;
            });
          },
          onFavoriteTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          onShareTap: () {
            print('Share button pressed');
          },
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
        ),
      ),
    );
  }

  void updateImageList(BuildContext context) async {
    String img = '';
    for (int i = 1; i <= 35; i++) {
      if (i < 10) {
        img = 'img0$i.jpg';
      } else {
        img = 'img$i.jpg';
      }

      imageList.add(
        NetworkImage(
          'https://images.stockx.com/360/Air-Jordan-3-Retro-Craft-Ivory/Images/Air-Jordan-3-Retro-Craft-Ivory/Lv2/$img?',
        ),
      );
    }
    await Future.delayed(const Duration(milliseconds: 1100));
    setState(() {});
  }
}
