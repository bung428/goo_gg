enum Routes {
  main('main', '/'),
  test('test', '/test'),
  login('login', '/login'),
  splash('splash', '/splash'),
  matchDetail('matchDetail', '/matchDetail'),
  ;

  final String path;
  final String name;

  const Routes(this.path, this.name);
}