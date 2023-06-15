import 'package:flutter/material.dart';
import 'package:shopify/tabs/DataExtractor.dart';

import '../Data/productsDATA.dart';
import '../Model/ProductData.dart';

class DetailScreen extends StatefulWidget {
  final SingleProductModel data;
  DetailScreen({required this.data});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'images/fav.png',
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/fav.png'),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.productName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.data.productModel,
                    style: const TextStyle(
                        color: Colors.indigo,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$ ${widget.data.productPrice}',
                    style: const TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  Text(
                    '\$ ${widget.data.productOldPrice}',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.data.productImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              children: [
                Expanded(
                  child: Image.network(
                    widget.data.productSecondImage,
                  ),
                ),
                Expanded(
                  child: Image.network(
                    widget.data.productThirdImage,
                  ),
                ),
                Expanded(
                  child: Image.network(
                    widget.data.productFourImage,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10),
            child: MaterialButton(
              height: 50,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide.none,
              ),
              color: Colors.blue.shade300,
              onPressed: () {},
              child: const Text(
                "Add to Cart",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
          const ExpansionTile(
            title: Text(
              "Description",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            children: [
              ListTile(
                title: Wrap(
                  children: [
                    Text(
                      "Hi my name is USMAN \nStudent in Comsats Wah Campus ",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Material",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "84% Nylon",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sizes",
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                "XS,Xl,X,M,S",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
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
                    "You May ALso Like",
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
          Container(
            height: 240,
            child: GridView.builder(
                itemCount: shoesData.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                primary: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 1),
                itemBuilder: (context, i) {
                  var data = shoesData[i];
                  return Alltabwidget(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(data: data)));
                    },
                    productName: data.productName,
                    productModel: data.productModel,
                    productPrice: data.productPrice,
                    productOldPrice: data.productOldPrice,
                    productImage: data.productImage,
                    productFourImage: data.productFourImage,
                    productThirdImage: data.productThirdImage,
                    productSecondImage: data.productSecondImage,
                    data: data,
                  );
                }),
          )
        ],
      ),
    );
  }
}
