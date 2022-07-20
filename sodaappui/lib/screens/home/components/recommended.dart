import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodaappui/screens/home/data/products.dart';
import 'package:sodaappui/screens/product_view/product_view_main.dart';

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
      margin: const EdgeInsets.only(top: 10, left: 20, right: 10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(0),
        itemBuilder: (ctx, index) {
          final pros = recommended[index];
          return GestureDetector(
            onTap: () {
              Get.to(() => ProductView(clickedItem: pros),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 500));
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              width: size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white.withOpacity(0.13),
                border:
                    Border.all(color: Colors.white.withOpacity(0.4), width: 1),
              ),
              margin: const EdgeInsets.only(right: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          pros.shortname,
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.8)),
                        ),
                        Text(
                          pros.flavour,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.5)),
                        ),
                        Text(
                          '\$${pros.price}',
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
                        image: AssetImage(pros.imageUrl),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: popular.length,
      ),
    );
  }
}
