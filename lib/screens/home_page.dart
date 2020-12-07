import 'dart:ui';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:movie_app/models/top_rated.dart';
import 'package:movie_app/models/trending_model.dart';
import 'package:movie_app/screens/views/top_rated_card.dart';
import 'package:movie_app/screens/views/trending_card.dart';
import 'package:movie_app/service/get_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/upcoming_titles_model.dart';
import 'package:movie_app/screens/views/upcoming_title_cardview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List<UpcomingTitles> upcomingTitles = new List<UpcomingTitles>();
  List<TopRated> topRated = new List<TopRated>();
  List<TrendingModel> trending = new List<TrendingModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUpcoming();
    getRecommended();
    getTrending();
  }

  getTrending() async {
    NetworkHelper networkClass = NetworkHelper();
    await networkClass.getTrendData();
    trending = networkClass.trend;
  }

  getRecommended() async {
    NetworkHelper networkclass = NetworkHelper();
    await networkclass.getRecommendData();
    topRated = networkclass.top;
  }

  getUpcoming() async {
    NetworkHelper networkclass = NetworkHelper();
    await networkclass.getUpcomingData();
    upcomingTitles = networkclass.upcomingTitles;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TMDB',
          style: TextStyle(
              fontWeight: FontWeight.w700, fontSize: 25, color: Colors.blue),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                //todo Add a search function
              },
              icon: Icon(Icons.search, size: 35),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Upcoming titles
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 18, top: 20),
              child: Text(
                'Upcoming Titles',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            UpcomingTitleCard(upcomingTitles: upcomingTitles),
            //Top Rated
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 18, top: 50),
              child: Text(
                'Top Rated',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              width: double.infinity,
              height: 300,
              child: TopRatedCard(topRated: topRated),
            ),
            //Trending
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 18, top: 50),
              child: Text(
                'Trending',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            TrendingCard(trending: trending),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.black,
        activeColor: Colors.black,
        initialActiveIndex: 1,
        curveSize: 0,
        items: [
          TabItem(icon: Icon(Icons.home_outlined)),
          TabItem(icon: Icon(Icons.favorite_border)),
          TabItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

//this tile here uses ListView.builder which does not have scroll snapping
class UpcomingTile extends StatelessWidget {
  const UpcomingTile({
    Key key,
    @required this.testColor,
  }) : super(key: key);

  final List<Color> testColor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: testColor.length,
        itemBuilder: (context, int i) {
          return Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                width: 420,
                height: 450,
                decoration: BoxDecoration(
                  color: testColor[i],
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i1.wp.com/www.heyuguys.com/images/2015/10/star-wars-the-force-awakens-poster-landscape.jpg?fit=1536%2C864&ssl=1'),
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Container(
                width: 420,
                height: 90,
                color: Colors.black.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Star Wars',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      '9.5/10',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
