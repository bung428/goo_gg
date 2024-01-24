enum SummonerRest {
  byName('/by-name'),
  byPuuid('/by-puuid'),
  byAccount('/by-account'),
  bySummoner('/by-summoner'),
  ;

  final String rest;
  const SummonerRest(this.rest);
}