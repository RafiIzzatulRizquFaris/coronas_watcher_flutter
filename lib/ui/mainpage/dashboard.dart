import 'package:carousel_slider/carousel_slider.dart';
import 'package:coronaswatcherflutter/contract/health_news_contract.dart';
import 'package:coronaswatcherflutter/model/health_news_model.dart';
import 'package:coronaswatcherflutter/presenter/health_news_presenter.dart';
import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }

  relatedNewsTitle() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10,),
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
      margin: EdgeInsets.only(left: 10, right: 10, top: 5,),
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
}
