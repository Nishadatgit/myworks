import 'package:flutter/material.dart';
import 'package:sodaappui/screens/home/data/datas.dart';

class CategoryArea extends StatelessWidget {
  const CategoryArea({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SodaCategory(
              fruitName: fruitNames[0],
              image: images[0],
              gradient: gradients[0],
            ),
            SodaCategory(
              fruitName: fruitNames[1],
              image: images[1],
              gradient: gradients[1],
            ),
            SodaCategory(
              fruitName: fruitNames[2],
              image: images[2],
              gradient: gradients[2],
            ),
            SodaCategory(
              fruitName: fruitNames[3],
              image: images[3],
              gradient: gradients[3],
            ),
            SizedBox(
              height: 60,
              width: 45,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 239, 241, 65),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 239, 241, 65),
                                offset: Offset(1, 1),
                                blurRadius: 30,
                                spreadRadius: 3),
                          ]),
                      child: const Icon(
                        Icons.display_settings_rounded,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SodaCategory extends StatelessWidget {
  const SodaCategory({
    Key? key,
    required this.fruitName,
    required this.image,
    required this.gradient,
  }) : super(key: key);

  final String fruitName;
  final String image;
  final List<Color> gradient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 45,
      child: Column(
        children: [
          Text(
            fruitName,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: gradient),
              ),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/png/$image.png',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
