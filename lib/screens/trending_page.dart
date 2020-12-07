import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingPage extends StatelessWidget {
  final String title, imgUrl, description, language;
  final double rating;
  TrendingPage(
      {this.language, this.description, this.rating, this.title, this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              //image
              Container(
                width: double.infinity,
                height: 800,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${imgUrl}'),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 800,
                color: Colors.black.withOpacity(0.75),
              ),
              Container(
                height: 800,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //title
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 60.0, left: 12, right: 12, bottom: 25),
                      child: Text(
                        '${title}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 3,
                      indent: 20,
                      endIndent: 20,
                    ),
                    //description
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        '${description}',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 3,
                      indent: 20,
                      endIndent: 20,
                    ),

                    //release date and language
                    SizedBox(height: 45),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 100,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //release date
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 12.0, top: 12),
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
                                padding:
                                    const EdgeInsets.only(right: 12.0, top: 12),
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
            ],
          ),
        ),
      ),
    );
  }
}
