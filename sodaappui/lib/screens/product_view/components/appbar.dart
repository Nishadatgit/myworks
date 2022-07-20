import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({
    Key? key,
    required this.size,
    required this.offwhite,
  }) : super(key: key);

  final Size size;
  final Color offwhite;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 12,
      left: 12,
      child: SizedBox(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 150, 150),
                  shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back, size: 19, color: offwhite),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 150, 150),
                  shape: BoxShape.circle),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications_outlined,
                        size: 21, color: offwhite),
                  ),
                  Positioned(
                    top: 8,
                    right: 6,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                          color: Colors.yellow, shape: BoxShape.circle),
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
