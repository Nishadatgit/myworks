import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'components/appbar.dart';
import 'components/category.dart';
import 'components/heading.dart';
import 'components/popular_soda.dart';
import 'components/recommended.dart';

class SodaHome extends StatefulWidget {
  SodaHome({Key? key}) : super(key: key);

  @override
  State<SodaHome> createState() => _SodaHomeState();
}

class _SodaHomeState extends State<SodaHome> {
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);
  int pageindex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pages = [
      MainPage(size: size),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              colors: [
                Colors.grey.withOpacity(0.6),
                Colors.black.withOpacity(0.99),
              ]),
        ),
        child: const Center(
          child: Text(
            'Search',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              colors: [
                Colors.grey.withOpacity(0.6),
                Colors.black.withOpacity(0.99),
              ]),
        ),
        child: const Center(
          child: Text(
            'Bag',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              colors: [
                Colors.grey.withOpacity(0.6),
                Colors.black.withOpacity(0.99),
              ]),
        ),
        child: const Center(
          child: Text(
            'Favorites',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp,
              colors: [
                Colors.grey.withOpacity(0.6),
                Colors.black.withOpacity(0.99),
              ]),
        ),
        child: const Center(
          child: Text(
            'Person',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      )
    ];
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            colors: [
              Colors.grey.withOpacity(0.6),
              Colors.black.withOpacity(0.99),
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: pages[pageindex],
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: selectedIndex,
          builder: ((context, value, child) {
            return CustomNavigationBar(
              opacity: 1,
              currentIndex: selectedIndex.value,
              selectedColor: Colors.yellow,
              bubbleCurve: Curves.easeIn,
              iconSize: 20,
              backgroundColor: const Color.fromARGB(255, 47, 46, 46),
              elevation: 0,
              isFloating: false,
              borderRadius: const Radius.circular(10),
              items: [
                CustomNavigationBarItem(icon: const Icon(Icons.home)),
                CustomNavigationBarItem(icon: const Icon(Icons.search)),
                CustomNavigationBarItem(icon: const Icon(Icons.shopping_bag)),
                CustomNavigationBarItem(
                    icon: const Icon(Icons.favorite_outline)),
                CustomNavigationBarItem(icon: const Icon(Icons.person_outline)),
              ],
              onTap: (index) {
                selectedIndex.value = index;
                setState(() {
                  pageindex = index;
                });
              },
            );
          }),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SodaAppBar(size: size),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeadingTitle(size: size),
                      const SizedBox(height: 20),
                      CategoryArea(size: size),
                      const SizedBox(height: 15),
                      TitleWithButton(size: size, text: 'Most Popular'),
                      PopularSodaArea(size: size),
                      TitleWithButton(size: size, text: 'Recommended'),
                      RecommendArea(size: size)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
