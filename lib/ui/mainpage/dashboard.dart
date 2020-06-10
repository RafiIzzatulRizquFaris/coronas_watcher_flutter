import 'package:carousel_slider/carousel_slider.dart';
import 'package:coronaswatcherflutter/contract/health_news_contract.dart';
import 'package:coronaswatcherflutter/model/health_news_model.dart';
import 'package:coronaswatcherflutter/presenter/health_news_presenter.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardScreen();
  }
}

class DashboardScreen extends State<Dashboard>
    implements HealthNewsContractView {
  List<Article> _listHealthArticle = List<Article>();
  HealthNewsPresenter _healthNewsPresenter;
  var isLoading;

  DashboardScreen() {
    _healthNewsPresenter = HealthNewsPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _healthNewsPresenter.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            relatedNewsTitle(),
            isLoading ? FlutterLogo() : relatedNewsCarousel(),
            covidTracker(),
          ],
        ),
      ),
    );
  }

  relatedNewsTitle() {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Related News",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Row(
            children: [
              Text(
                "View All",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Color(0xff00C4FF),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Image.asset(
                  "assets/icon-angle-right.png",
                  width: 7.5,
                  height: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  relatedNewsCarousel() {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
      ),
      child: CarouselSlider.builder(
        itemCount: _listHealthArticle.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Stack(
                children: [
                  Image.network(
                    _listHealthArticle[index].urlToImage,
                    fit: BoxFit.cover,
                    width: 1000,
                  ),
//                Container(
//                  decoration: BoxDecoration(
//                    color: Colors.grey,
//                    shape: BoxShape.rectangle,
//                  ),
//                ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Text(
                        _listHealthArticle[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 2,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
        ),
      ),
    );
  }

  @override
  setHealthNews(HealthNewsModel newsModel) async {
    if (newsModel.article.isNotEmpty) {
      setState(() {
        _listHealthArticle = newsModel.article;
        isLoading = false;
      });
    } else {
      print("Object is empty");
    }
  }

  covidTracker() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        shape: BoxShape.rectangle,
        color: Color(0xffFFBF2A),
      ),
      child: Column(
        children: [
          globalStatus(),
          todayStatus(),
        ],
      ),
    );
  }

  globalStatus() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "COVID - 19 Tracker",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: 5,
              right: 5,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shape: BoxShape.rectangle,
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icon-globe-asia.png",
                      width: 25,
                      height: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Global Status",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "123.321",
                      style: TextStyle(
                        color: Color(0xffFFBF2A),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/icon-angle-down.png",
                      height: 10,
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 30,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                activeCasesSection(),
                recoveryCasesSection(),
                deathCasesSection(),
              ],
            ),
          )
        ],
      ),
    );
  }

  todayStatus() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        shape: BoxShape.rectangle,
        color: Color(0xff9381F2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: Image.asset("assets/illustration-stay-home.png"),
          ),
          Container(
            margin: EdgeInsets.only(left: 30,bottom: 30,),
            child: Text(
              "Today",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  activeCasesSection() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Color(0xff00C4FF),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Active Cases",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Text(
                "123.321",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          LinearPercentIndicator(
            animation: true,
            lineHeight: 10,
            animationDuration: 2500,
            percent: 0.6,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Color(0xff00C4FF),
          ),
        ],
      ),
    );
  }

  recoveryCasesSection() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Color(0xff00FF6D),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Recovery Cases",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Text(
                "123.321",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          LinearPercentIndicator(
            animation: true,
            lineHeight: 10,
            animationDuration: 2500,
            percent: 0.2,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Color(0xff00FF6D),
          ),
        ],
      ),
    );
  }

  deathCasesSection() {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      color: Color(0xffFF0000),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Death Cases",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Text(
                "123.321",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          LinearPercentIndicator(
            animation: true,
            lineHeight: 10,
            animationDuration: 2500,
            percent: 0.4,
            linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: Color(0xffFF0000),
          ),
        ],
      ),
    );
  }
}
