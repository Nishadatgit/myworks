import 'package:flutter/material.dart';

class RecommendArea extends StatelessWidget {
  const RecommendArea({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      width: size.width,
      height: size.height * 0.15,
      margin: const EdgeInsets.only(
          top: 10, left: 20, right: 10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
              flavour: 'Caffeine flavour',
              price: '50',
            ),
            RecommendedCard(
              size: size,
              title: 'Cola',
              image: 'cola',
              flavour: 'Cola flavour',
              price: '50',
            ),
          ],
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