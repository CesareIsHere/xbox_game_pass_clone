// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Color.fromARGB(255, 48, 48, 48),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Profile(),
          SizedBox(height: 20),
          Menu(),
          SizedBox(height: 40),
          Library(),
          Expanded(
            child: Container(),
          ),
          Footer(),
        ],
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 17,
          backgroundImage: NetworkImage(
              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CesareIsHere',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(2),
              child: Text("ULTIMATE",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1)),
            )
          ],
        ),
        Expanded(child: Container()),
        Icon(
          Icons.notifications_outlined,
          color: Colors.white,
          size: 28,
        ),
      ],
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(icon: Icons.home, text: "Home"),
        MenuItem(icon: Icons.video_library_outlined, text: "La mia raccolta"),
        MenuItem(icon: Icons.cloud_outlined, text: "Cloud Gaming"),
        MenuItem(icon: Icons.people_outline_outlined, text: "Community"),
        MenuItem(icon: Icons.shopping_basket_outlined, text: "Store"),
      ],
    );
  }
}

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Installato",
          style: TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w800),
        ),
        SizedBox(height: 5),
        LibraryItem(
          image: NetworkImage("image1"),
          text: "Game 1",
        ),
        LibraryItem(
          image: NetworkImage("image2"),
          text: "Game 2",
        ),
        LibraryItem(
          image: NetworkImage("image3"),
          text: "Game 3",
        ),
      ],
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.download_outlined, color: Colors.white, size: 28),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Coda",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3),
              Text(
                "Nessuna installazione attiva",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Commons ----------------------------------------------

class MenuItem extends StatelessWidget {
  const MenuItem({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        hoverColor: Colors.grey.shade600,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 28,
              ),
              const SizedBox(width: 14),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LibraryItem extends StatelessWidget {
  const LibraryItem({super.key, required this.image, required this.text});

  final NetworkImage image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
