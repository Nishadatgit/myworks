// ignore_for_file: sized_box_for_whitespace

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project_aqua/constraints.dart';

import 'package:project_aqua/screens/home/components/header_with_search_bar.dart';
import 'package:project_aqua/screens/home/components/recommended_plants.dart';
import 'package:project_aqua/screens/home/components/title_with_more_button.dart';

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          HeaderWithSearchBar(size: size),
          TitleWithMoreButton(
            btnText: 'More',
            press: () {},
          ),
          RecommendedPlants()
        ],
      ),
    );
  }
}
