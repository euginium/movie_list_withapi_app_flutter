import 'package:flutter/material.dart';

class TopRatedPage extends StatelessWidget {
  final String title, imgUrl, description, language;
  final double rating;
  TopRatedPage(
      {this.language, this.imgUrl, this.description, this.title, this.rating});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //title
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, left: 12, right: 12, bottom: 25),
                child: Text(
                  '${title}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              //image
              Container(
                width: 400,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${imgUrl}'),
                  ),
                ),
              ),
              //description
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '${description}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                ),
              ),
              //release date and language
              SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Stack(
                  children: [
                    Container(
                      width: 410,
                      height: 100,
                      color: Colors.grey.shade900,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //release date
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 12),
                          child: Column(
                            children: [
                              Text(
                                'Average Rating',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${rating}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // language
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0, top: 12),
                          child: Column(
                            children: [
                              Text(
                                'Language',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${language.toUpperCase()}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
