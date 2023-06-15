import 'package:flutter/material.dart';

import '../../Data/productsDATA.dart';
import '../../screen/detailscreen.dart';
import '../DataExtractor.dart';

class Cloths extends StatelessWidget {
  const Cloths({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.vertical,
        itemCount: clothsData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1),
        itemBuilder: (context, i) {
          var data = clothsData[i];
          return Alltabwidget(
            productName: data.productName,
            productModel: data.productModel,
            productPrice: data.productPrice,
            productOldPrice: data.productOldPrice,
            productImage: data.productImage,
            productFourImage: data.productFourImage,
            productThirdImage: data.productThirdImage,
            productSecondImage: data.productSecondImage,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailScreen(data: clothsData[i]),),);

            }, data: data,
          );
        },
      ),
    );
  }
}
