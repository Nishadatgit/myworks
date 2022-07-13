import 'dart:ui';

import 'package:flutter/material.dart';

import 'components/appbar.dart';
import 'components/category.dart';
import 'components/heading.dart';
import 'components/popular_soda.dart';

class SodaHome extends StatelessWidget {
  const SodaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                tileMode: TileMode.mirror,
                colors: [
                  Colors.transparent.withOpacity(0.6),
                  Colors.transparent.withOpacity(0.99),
                ]),
          ),
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
                          Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            width: size.width,
                            height: size.height * 0.15,
                            margin: const EdgeInsets.only(
                                top: 10, left: 20, right: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  RecommendedCard(
                                    size: size,
                                    title: 'Fanta',
                                    image: 'fanta',
                                    flavour: 'Good flavour',
                                    price: '60',
                                  ),
                                  RecommendedCard(
                                    size: size,
                                    title: 'Pepsi',
                                    image: 'pepsi',
                                    flavour: 'Good flavour',
                                    price: '50',
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedCard extends StatelessWidget {
  const RecommendedCard({
    Key? key,
    required this.size,
    required this.title,
    required this.image,
    required this.price,
    required this.flavour,
  }) : super(key: key);
  final String title;
  final String image;
  final String price;
  final String flavour;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: size.width * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.13),
          border: Border.all(color: Colors.white.withOpacity(0.4), width: 1)),
      margin: const EdgeInsets.only(right: 30),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.8)),
                ),
                Text(
                  flavour,
                  style: TextStyle(color: Colors.white.withOpacity(0.5)),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.8)),
                )
              ],
            ),
          ),
          Container(
            width: 45,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/png/$image.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
