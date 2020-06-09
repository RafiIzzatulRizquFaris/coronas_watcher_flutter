import 'dart:convert';

import 'package:coronaswatcherflutter/constant.dart';
import 'package:coronaswatcherflutter/contract/health_news_contract.dart';
import 'package:coronaswatcherflutter/model/health_news_model.dart';
import 'package:http/http.dart';

class HealthNewsPresenter implements HealthNewsContractPresenter{

  HealthNewsContractView _healthNewsContractView;
  HealthNewsPresenter(this._healthNewsContractView);

  @override
  Future<HealthNewsModel> getHealthNews() async {
    String url = "${Constant.NEWS_API_URL}top-headlines?country=id&category=${Constant.HEALTH_NEWS_CATEGORY}&apiKey=${Constant.NEWS_API_KEY}";
    Client client = Client();
    final response = await client.get(url);
    if(response.statusCode != 200){
      print("Status is not 200");
    }
    var content = json.decode(response.body);
    return HealthNewsModel.mapping(content);
  }

  @override
  loadData() {
    getHealthNews().then((value) => _healthNewsContractView.setHealthNews(value));
  }

}