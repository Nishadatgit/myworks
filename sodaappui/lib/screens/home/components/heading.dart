import 'package:flutter/material.dart';

class HeadingTitle extends StatelessWidget {
  const HeadingTitle({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 12, right: 12),
      child: SizedBox(
        height: size.height * 0.080,
        width: size.width * 0.5,
        child: Text(
          'Explore Our New Tasty Drinks',
          style: TextStyle(
              fontSize: 25,
              color: Colors.white.withOpacity(0.9),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class TitleWithButton extends StatelessWidget {
  const TitleWithButton({
    Key? key,
    required this.size,
    required this.text,
  }) : super(key: key);
  final String text;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 12, right: 12),
      height: 40,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 19,
                fontWeight: FontWeight.w400),
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'See More',
                style: TextStyle(
                    color: Color.fromARGB(255, 203, 190, 190),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ))
        ],
      ),
    );
  }
}
