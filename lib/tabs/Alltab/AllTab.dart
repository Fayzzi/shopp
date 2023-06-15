import 'package:flutter/material.dart';
import 'package:shopify/screen/detailscreen.dart';
import 'package:shopify/tabs/DataExtractor.dart';

import '../../Data/productsDATA.dart';

class Alltab extends StatefulWidget {
  const Alltab({Key? key}) : super(key: key);

  @override
  State<Alltab> createState() => _AlltabState();
}

class _AlltabState extends State<Alltab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Newly Arrived",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Show All",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ))
            ],
          ),
        ),
        //Showing data of all tab
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            scrollDirection: Axis.vertical,
            itemCount: singleProductData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemBuilder: (context, i) {
              var data = singleProductData[i];
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(data: data)));
                },
                data: data,
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        //divider of trending product
        const Padding(
          padding: EdgeInsets.only(left: 12, right: 12),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  "Trending Products",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        //horizental scrolling gridview
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300),
          height: 210,
          child: GridView.builder(
            shrinkWrap: true,
            primary: true,
            itemCount: trendingdata.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, i) {
              var data = trendingdata[i];
              return Alltabwidget(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailScreen(data: data)));
                },
                productName: data.productName,
                productModel: data.productModel,
                productPrice: data.productPrice,
                productOldPrice: data.productOldPrice,
                productFourImage: data.productFourImage,
                productThirdImage: data.productThirdImage,
                productSecondImage: data.productSecondImage,
                productImage: '',
                data: data,
              );
            },
          ),
        ),
      ],
    );
  }
}
