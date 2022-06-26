import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_aqua/constraints.dart';

class HeaderWithSearchBar extends StatelessWidget {
  const HeaderWithSearchBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: defaultPadding * 2.5),
      height: size.height * 0.2,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                bottom: defaultPadding + 36),
            height: size.height * 0.2 - 27,
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(36),
                bottomRight: Radius.circular(36),
              ),
            ),
            child: Row(
              children: [
                Text(
                  'Hi Aquatica',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Image.asset('assets/images/logo.png')
              ],
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              height: 54,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23),
                      offset: const Offset(0, 10),
                    ),
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: kPrimaryColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                  SvgPicture.asset('assets/icons/search.svg')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}