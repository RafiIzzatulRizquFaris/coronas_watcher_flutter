class CasesByCountryModel{
  final CountryStat countryStat;

  CasesByCountryModel({this.countryStat});

  factory CasesByCountryModel.mapping(Map<String, dynamic> obj){
    return CasesByCountryModel(
      countryStat: CountryStat.mapping(obj['countries_stat'])
    );
  }
}

class CountryStat{
  final String activeCases;
  final String cases;
  final String countryName;
  final String deaths;
  final String newCases;
  final String newDeaths;
  final String region;
  final String seriousCritical;
  final String totalCasesPer1mPopulation;
  final String totalRecovered;

  CountryStat({this.activeCases, this.cases, this.countryName, this.deaths, this.newCases, this.newDeaths, this.region, this.seriousCritical, this.totalCasesPer1mPopulation, this.totalRecovered});

  factory CountryStat.mapping(Map<String, dynamic> obj){
    return CountryStat(
      activeCases: obj['active_cases'],
      cases: obj['cases'],
      countryName: obj['country_name'],
      deaths: obj['deaths'],
      newCases: obj['new_cases'],
      newDeaths: obj['new_deaths'],
      region: obj['region'],
      seriousCritical: obj['serious_critical'],
      totalCasesPer1mPopulation: obj['total_cases_per_1m_population'],
      totalRecovered: obj['total_recovered'],
    );
  }
}