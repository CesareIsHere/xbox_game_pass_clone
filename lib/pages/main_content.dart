// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        // image: const DecorationImage(
        //   image: AssetImage('assets/images/background.jpg'),
        //   fit: BoxFit.cover,
        // ),
      ),
      child: Stack(
        children: [
          Container(
            height: 600,
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/riot_games_1920_1080.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Body(),
          FixedHeader(),
        ],
      ),
    );
  }
}

class FixedHeader extends StatelessWidget {
  const FixedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 6),
                Text(
                  "Trova giochi, componenti aggiuntivi e altro ancora",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 120),
              ],
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  Body({super.key});
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 70),
          //logo gamepass image
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(
              'assets/images/logo_gamepass.png',
              height: 50,
            ),
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text("Panoramica",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
          ),
          SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              height: 350,
              width: double.maxFinite,
              child: Scrollbar(
                thumbVisibility: true,
                controller: scrollController,
                child: ListView(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    carouselItem(
                      imageUrl: 'assets/images/riot_games_1920_1080.png',
                      title: "Sblocca i vantaggi Riot Games",
                      subtitle:
                          "Gli abbonati sbloccano tutti gli agenti, boost XP e altro",
                    ),
                    carouselItem(
                      imageUrl: 'assets/images/valorant_1920_1080.jpg',
                      title: "Valorant",
                      subtitle:
                          "Gli abbonati sbloccano tutti gli agenti, boost XP e altro",
                    ),
                    carouselItem(
                      imageUrl: 'assets/images/leagueoflegends_1920_1080.jpg',
                      title: "League of Legends",
                      subtitle:
                          "Gli abbonati sbloccano tutti i campioni e ottengono un bonus di 20% per ogni partita",
                      darker: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Container(
            height: 200,
            color: Colors.red,
          ),
          Container(
            height: 200,
            color: Colors.green,
          ),
          Container(
            height: 200,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

Widget carouselItem(
    {required String imageUrl,
    required String title,
    required String subtitle,
    bool darker = false}) {
  return Stack(
    children: [
      Container(
        width: 600,
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.luminosity),
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        width: 600,
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.8),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 6),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      Visibility(
        visible: darker,
        child: Container(
          width: 600,
          color: Colors.black.withOpacity(0.5),
        ),
      )
    ],
  );
}
