import 'package:flutter/material.dart';
import 'package:project_aqua/constraints.dart';

class TitleWithMoreButton extends StatelessWidget {
  const TitleWithMoreButton({Key? key, required this.btnText, required this.press})
      : super(key: key);
  final String btnText;
  final  VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          TextWithUnderLine(text: 'Recommended'),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: kPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed:press,
            child:  Text(
              btnText,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class TextWithUnderLine extends StatelessWidget {
  const TextWithUnderLine({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: defaultPadding / 4),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            left: 0,
            child: Container(
              margin: const EdgeInsets.only(right: defaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}