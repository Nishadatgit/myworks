import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sodaappui/screens/home/data/products.dart';

import '../../product_view/product_view_main.dart';

class PopularSodaArea extends StatelessWidget {
  const PopularSodaArea({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        width: size.width,
        height: size.height * 0.26,
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemBuilder: (ctx, index) {
            final pros = popular[index];
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => ProductView(clickedItem: pros),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 500),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10, right: 12),
                height: size.height * 0.2,
                width: size.width * 0.26,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.white.withOpacity(0.4), width: 1),
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
                                color: pros.shadow,
                                offset: const Offset(0, 10),
                                blurRadius: 50,
                                spreadRadius: -20)
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(pros.imageUrl),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      child: Text(
                        pros.shortname,
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
                        '\$${pros.price.toString()}',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          itemCount: popular.length,
        ));
  }
}
