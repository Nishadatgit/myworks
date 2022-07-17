import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sodaappui/screens/home/components/heading.dart';
import 'package:sodaappui/screens/home/data/products.dart';

class ProductView extends StatefulWidget {
  ProductView({Key? key, required this.clickedItem}) : super(key: key);
  final Product clickedItem;

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final offwhite = Colors.white.withOpacity(0.7);

  final shadowColor = Color.fromARGB(255, 12, 86, 147);
  int selectedCount = 0;
  String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem";
  final persons = [
    'assets/images/greg.jpg',
    'assets/images/james.jpg',
    'assets/images/john.jpg',
    'assets/images/olivia.jpg',
    'assets/images/sam.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                tileMode: TileMode.clamp,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.99),
                ]),
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.45,
                width: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        height: size.height * 0.44,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 80),
                              height: size.height * 0.32,
                              width: size.width * 0.32,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage(widget.clickedItem.imageUrl),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: widget.clickedItem.shadow,
                                      blurRadius: 50,
                                      spreadRadius: -10,
                                    )
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                    AppBarRow(size: size, offwhite: offwhite),
                    Positioned(
                      left: 12,
                      top: 75,
                      child: SizedBox(
                        height: size.height * 0.34,
                        width: size.width * 0.4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Carbohydrate',
                                style:
                                    TextStyle(color: offwhite, fontSize: 19)),
                            const SizedBox(height: 8),
                            Text('${widget.clickedItem.carbo.toString()} %',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23)),
                            const SizedBox(height: 15),
                            Text('Water',
                                style:
                                    TextStyle(color: offwhite, fontSize: 19)),
                            const SizedBox(height: 8),
                            Text('${widget.clickedItem.water.toString()} %',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23)),
                            const SizedBox(height: 19),
                            Text('Sugar',
                                style:
                                    TextStyle(color: offwhite, fontSize: 19)),
                            const SizedBox(
                              height: 8,
                            ),
                            Text('${widget.clickedItem.sugar.toString()} %',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 23)),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 12,
                      child: SizedBox(
                        height: size.height * 0.05,
                        width: size.width * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                                backgroundColor: widget.clickedItem.shadow,
                                maxRadius: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedCount > 0) {
                                        selectedCount = selectedCount - 1;
                                      }
                                    });
                                  },
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                )),
                            Container(
                                alignment: Alignment.center,
                                height: 25,
                                width: 25,
                                child: Text(selectedCount.toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18))),
                            CircleAvatar(
                                backgroundColor: widget.clickedItem.shadow,
                                maxRadius: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCount = selectedCount + 1;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.clickedItem.name,
                      style: TextStyle(
                          color: offwhite,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                    RatingBar.builder(
                      itemBuilder: ((context, index) {
                        return Icon(
                          Icons.star,
                          color: widget.clickedItem.shadow,
                        );
                      }),
                      onRatingUpdate: (value) {},
                      itemCount: 5,
                      itemSize: 20,
                      minRating: 1,
                      itemPadding: const EdgeInsets.all(0),
                      maxRating: 5,
                      glowColor: shadowColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  description,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),
              TitleWithButton(size: size, text: 'Reviews'),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Container(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      if (index == persons.length) {
                        return RiviewAdder(
                          image: persons[0],
                          isAdduser: true,
                        );
                      }

                      return RiviewAdder(image: persons[index]);
                    },
                    itemCount: persons.length + 1,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                child: Row(
                  children: [
                    Text(
                      '\$${widget.clickedItem.price}',
                      style: const TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Spacer(),
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                          color: widget.clickedItem.shadow,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: widget.clickedItem.shadow,
                                blurRadius: 20,
                                spreadRadius: 1)
                          ]),
                      child: const Text(
                        'Buy Now',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
