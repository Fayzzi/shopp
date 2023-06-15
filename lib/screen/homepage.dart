import 'package:flutter/material.dart';
import 'package:shopify/AuthServices/FirebaseAuth.dart';
import 'package:shopify/screen/Favorites.dart';
import 'package:shopify/screen/loginscreen.dart';
import 'package:shopify/tabs/Alltab/AllTab.dart';

import '../tabs/Accessories/Accessories.dart';
import '../tabs/ShoesTAb/shoes.dart';
import '../tabs/clothingtab/clothingTabWiget.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading:
              IconButton(
                onPressed: () async {
                  await authService().Signout();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const LoginPAge()));
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),

          bottom: const TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            //labelPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.green,
            isScrollable: true,
            tabs: [
              Text(
                'All',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                'Shoes',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                'Clothes',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                'Accessories',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text(
                'Gadgets',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ],
          ),
          toolbarHeight: 60,
          elevation: 4,
          backgroundColor: Colors.grey.shade300,
          title: Column(
            children: const [
              SizedBox(
                height: 12,
              ),
              Text(
                'Shopify',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              Text(
                'All you need is here',
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: ()  {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FavoritesItem()));

              },
              icon: const Icon(
                Icons.favorite_outline,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Image(
                  image: AssetImage(
                'images/filter.png',
              )),
            ),
            IconButton(
              onPressed: () {},
              icon: const Image(
                  image: AssetImage(
                'images/search.png',
              )),
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade300,
        body: const TabBarView(
          children: [
            Alltab(),
            Shoes(),
            Cloths(),
            Accessories(),
            Text(
              "This is Gadgets",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
