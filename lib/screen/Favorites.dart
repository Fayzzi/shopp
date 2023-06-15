import 'package:flutter/material.dart';
import '../Model/ProductData.dart';

List<SingleProductModel> Favorite = [];

class FavoritesItem extends StatefulWidget {
  @override
  State<FavoritesItem> createState() => _FavoritesItemState();
}

class _FavoritesItemState extends State<FavoritesItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Favorites",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: true,
            itemCount: Favorite.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1),
            itemBuilder: (context, i) {
              var data = Favorite[i];
              return Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(data.productImage),
                              fit: BoxFit.cover),
                        ),
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              Favorite.remove(data);
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 2,
                        ),
                        Text(data.productName,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                        Text(data.productModel,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("\$${data.productPrice}",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                )),
                            Text("\$${data.productOldPrice}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough)),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
