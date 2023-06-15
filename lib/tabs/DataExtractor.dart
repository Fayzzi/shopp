import 'package:flutter/material.dart';
import 'package:shopify/screen/Favorites.dart';

import '../Model/ProductData.dart';

class Alltabwidget extends StatelessWidget {
  final String productImage;
  final String productModel;
  final String productName;
  final double productOldPrice;
  final double productPrice;
  final String productFourImage;
  final String productSecondImage;
  final String productThirdImage;
  final VoidCallback onPressed;
  final SingleProductModel data;
  Alltabwidget(
      {required this.onPressed,
      required this.productName,
      required this.productModel,
      required this.productPrice,
      required this.productOldPrice,
      required this.productImage,
      required this.productFourImage,
      required this.productThirdImage,
      required this.productSecondImage,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        //padding: EdgeInsets.only(left: 12,right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                      image: NetworkImage(productThirdImage),
                      fit: BoxFit.cover),
                ),
                child: IconButton(
                  onPressed: () {
                    Favorite.add(data);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Added to wishlist"),
                      ),
                    );
                  },
                  icon: Icon(Icons.favorite),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(productName),
                  Text(productModel),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Text(
                          '\$ $productPrice',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '\$ $productOldPrice',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
