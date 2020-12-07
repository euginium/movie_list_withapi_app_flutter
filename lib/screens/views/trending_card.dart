import 'package:flutter/material.dart';
import 'package:movie_app/models/trending_model.dart';
import 'package:movie_app/screens/trending_page.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    Key key,
    @required this.trending,
  }) : super(key: key);

  final List<TrendingModel> trending;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: trending.length,
          itemBuilder: (context, int i) {
            return InkWell(
              onTap: () {
                //todo navigate to trending page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return TrendingPage(
                      title: trending[i].title,
                      imgUrl: trending[i].imgUrl,
                      rating: trending[i].rating,
                      description: trending[i].description,
                      language: trending[i].language,
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
                          'https://image.tmdb.org/t/p/w600_and_h900_bestv2${trending[i].imgUrl}'),
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
                          '${trending[i].title}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            );
          }),
    );
  }
}
