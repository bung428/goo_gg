enum Routes {
  splash('splash', '/splash'),
  login('login', '/login'),
  main('main', '/'),
  matchDetail('matchDetail', '/matchDetail'),
  ;

  final String path;
  final String name;

  const Routes(this.path, this.name);
}