import 'package:flutter/material.dart';

class PopularSodaArea extends StatelessWidget {
  const PopularSodaArea({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: size.width,
      height: size.height * 0.26,
      padding: const EdgeInsets.only(top: 0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            PopularSoda(
              name: 'Fanta',
              price: '30',
              canImage: 'fanta',
              size: size,
              color: Colors.purple,
            ),
            PopularSoda(
              price: '25',
              name: 'Pepsi',
              canImage: 'pepsi2',
              size: size,
              color: const Color.fromARGB(255, 24, 128, 213),
            ),
            PopularSoda(
              name: 'Dew',
              price: '34',
              canImage: 'dew',
              size: size,
              color: const Color.fromARGB(255, 21, 233, 28),
            ),
            PopularSoda(
              price: '45',
              name: 'Cola',
              canImage: 'cola',
              size: size,
              color: const Color.fromARGB(255, 238, 25, 25),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularSoda extends StatelessWidget {
  const PopularSoda({
    Key? key,
    required this.size,
    required this.color,
    required this.canImage,
    required this.name,
    required this.price,
  }) : super(key: key);

  final Size size;
  final Color color;
  final String canImage;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, right: 20),
      height: size.height * 0.2,
      width: size.width * 0.26,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.4), width: 1),
        color: Colors.white.withOpacity(0.10),
        borderRadius: const BorderRadius.all(
          Radius.circular(80),
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -20,
            child: Container(
              height: 100,
              width: 70,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: color,
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      spreadRadius: -20)
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/png/$canImage.png'),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            child: Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 15,
            child: Text(
              '\$$price',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
