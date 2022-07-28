import 'package:course_app_ui/data/tutor_details.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    hintText: 'Search',
                    isDense: false,
                    suffixIcon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.search,
                          size: 20,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(Icons.settings, size: 20),
                        SizedBox(
                          width: 4,
                        ),
                        Icon(Icons.more_vert, size: 20),
                        SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                    filled: true,
                    disabledBorder: InputBorder.none,
                    fillColor: Colors.white),
              ),
            ),
          ),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (ctx, index) {
            final tutor = tutors[index];
            return ProfileCard(
              tutor: tutor,
            );
          },
          itemCount: tutors.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
    required this.tutor,
  }) : super(key: key);
  final Tutor tutor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          height: 160,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(tutor.imageUrl),
                      radius: 40,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tutor.name,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              tutor.about,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      child: const Text(
                        'About',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen),
                      child: const Text(
                        'Hire',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
