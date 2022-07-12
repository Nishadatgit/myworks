import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SodaHome extends StatelessWidget {
  const SodaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                tileMode: TileMode.mirror,
                colors: [
                  Colors.transparent.withOpacity(0.45),
                  Colors.transparent.withOpacity(0.966),
                ]),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets')),
                        border: Border.all(color: Colors.grey, width: 3),
                        color: Colors.white,
                        shape: BoxShape.circle),
                    height: size.height * 0.05,
                    width: size.width * 0.10,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
