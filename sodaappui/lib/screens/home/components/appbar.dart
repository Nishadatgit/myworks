import 'package:flutter/material.dart';

class SodaAppBar extends StatelessWidget {
  const SodaAppBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      backgroundColor: Colors.transparent,
      leadingWidth: 50,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/images/aloneboy.jpg'),
                fit: BoxFit.contain),
            border:
                Border.all(color: const Color.fromARGB(255, 122, 120, 120), width: 3),
            color: Colors.white,
            shape: BoxShape.circle),
        height: size.height * 0.05,
        width: size.width * 0.10,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[400]),
                  child: const Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                Positioned(
                  top: 4,
                  right: 2,
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: const BoxDecoration(
                        color: Colors.yellow, shape: BoxShape.circle),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
