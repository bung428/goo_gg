enum RiotApiType {
  account('/riot/account/v1/accounts'),
  summoner('/lol/summoner/v4/summoners'),
  match('/lol/match/v5/matches'),
  league('/lol/league/v4/entries'),
  ;

  final String api;
  const RiotApiType(this.api);
}