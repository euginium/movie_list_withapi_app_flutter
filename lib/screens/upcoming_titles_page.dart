import 'package:flutter/material.dart';

class UpcomingTitlePage extends StatelessWidget {
  final String title, description, imgUrl, release_date, language;
  UpcomingTitlePage(
      {this.title,
      this.description,
      this.imgUrl,
      this.release_date,
      this.language});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //title
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 12, right: 12),
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
                    fit: BoxFit.contain,
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/original${imgUrl}'),
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
                                'Release Date',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${release_date}',
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
