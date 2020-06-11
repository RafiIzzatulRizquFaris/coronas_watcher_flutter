class WorldTotalModel{
  final String newCases;
  final String newDeaths;
  final String statisticTakenAt;
  final String totalCases;
  final String totalDeaths;
  final String totalRecovered;

  WorldTotalModel({this.newCases, this.newDeaths, this.statisticTakenAt, this.totalCases, this.totalDeaths, this.totalRecovered});

  factory WorldTotalModel.mapping(Map<String, dynamic> obj){
    return WorldTotalModel(
      totalRecovered: obj['total_recovered'],
      newDeaths: obj['new_deaths'],
      newCases: obj['new_cases'],
      statisticTakenAt: obj['statistic_taken_at'],
      totalCases: obj['total_cases'],
      totalDeaths: obj['total_deaths'],
    );
  }
}