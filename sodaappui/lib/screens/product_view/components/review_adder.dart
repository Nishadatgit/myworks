import 'package:flutter/material.dart';

class RiviewAdder extends StatelessWidget {
  const RiviewAdder({Key? key, this.isAdduser = false, required this.image})
      : super(key: key);

  final bool isAdduser;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
          minRadius: 25,
          backgroundColor:
              isAdduser ? const Color.fromARGB(255, 42, 41, 41) : null,
          backgroundImage: isAdduser ? null : AssetImage(image),
          child: isAdduser
              ? Icon(
                  Icons.add,
                  color: Colors.white.withOpacity(0.8),
                )
              : null),
    );
  }
}