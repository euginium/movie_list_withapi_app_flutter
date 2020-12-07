import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/upcoming_titles_model.dart';

import '../upcoming_titles_page.dart';

//this tile here uses PageView.builder. This one has snapping.(now in use)
class UpcomingTitleCard extends StatelessWidget {
  const UpcomingTitleCard({Key key, @required this.upcomingTitles})
      : super(key: key);

  final List<UpcomingTitles> upcomingTitles;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: PageView.builder(
        itemCount: upcomingTitles.length,
        itemBuilder: (context, int i) {
          return InkWell(
            onTap: () {
              //todo Navigate to item page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return UpcomingTitlePage(
                    title: upcomingTitles[i].title,
                    description: upcomingTitles[i].description,
                    imgUrl: upcomingTitles[i].imgUrl,
                    release_date: upcomingTitles[i].releaseDate,
                    language: upcomingTitles[i].language,
                  );
                }),
              );
            },
            splashColor: Colors.white,
            child: Stack(
              children: [
                //backdrop
                Container(
                  width: 420,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/original${upcomingTitles[i].imgUrl}'),
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                //texts
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 420,
                      height: 50,
                      color: Colors.black.withOpacity(0.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            child: Text(
                              '${upcomingTitles[i].title}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            width: 200,
                          ),
                          Text(
                            '${upcomingTitles[i].releaseDate}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
