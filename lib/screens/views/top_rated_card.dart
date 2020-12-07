import 'package:flutter/material.dart';
import 'package:movie_app/models/top_rated.dart';
import 'package:movie_app/screens/top_rated_page.dart';

class TopRatedCard extends StatelessWidget {
  const TopRatedCard({
    Key key,
    @required this.topRated,
  }) : super(key: key);

  final List<TopRated> topRated;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: topRated.length,
        itemBuilder: (context, int i) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return TopRatedPage(
                    title: topRated[i].title,
                    description: topRated[i].description,
                    imgUrl: topRated[i].imgUrl,
                    rating: topRated[i].popularity,
                    language: topRated[i].language,
                  );
                }),
              );
            },
            child: Stack(children: [
              Container(
                margin: EdgeInsets.only(left: 8, right: 25),
                width: 210,
                height: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w600_and_h900_bestv2${topRated[i].imgUrl}'),
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 210,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Rating: ${topRated[i].popularity.toInt()}/10',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          );
        });
  }
}
