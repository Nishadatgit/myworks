import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/home.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white.withOpacity(1),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        title: const Hero(
          tag: 'about',
          child: Text(
            'About',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const AboutMe(),
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(bottom: 20, top: 10, right: 10, left: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFFcc2b5e), Color(0xFF753a88)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView(
        dragStartBehavior: DragStartBehavior.down,
        physics: BouncingScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const ImageDetails(image: 'assets/images/mypic.jpg'),
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 135, right: 135, top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Hero(
                  tag: 'img',
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/mypic.jpg'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const MyRow(text: 'Mohamed Nishad', icon: Icons.person),
          const MyRow(text: 'Flutter developer', icon: Icons.work),
          GestureDetector(
              onTap: () {
                Uri url = Uri.parse('https://www.instagram.com/_nishxd/');
                launchUrl(url);
              },
              child: const MyRow(
                  text: '_nishxd', icon: FontAwesomeIcons.instagram)),
          GestureDetector(
            onTap: () {
              Uri url = Uri.parse('https://github.com/Nishadatgit');
              launchUrl(url);
            },
            child:
                const MyRow(text: 'Nishadatgit', icon: FontAwesomeIcons.github),
          ),
        ],
      ),
    );
  }
}

class MyRow extends StatelessWidget {
  const MyRow({Key? key, required this.text, required this.icon})
      : super(key: key);
  final String text;
  final dynamic icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 340,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.grey[200],
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(icon),
                    const SizedBox(
                      width: 70,
                    ),
                    Text(
                      text,
                      style: GoogleFonts.aBeeZee(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
