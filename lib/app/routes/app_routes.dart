abstract class AppRoutes {
  AppRoutes._();
  static const initial = _Paths.login;
  static const login = _Paths.login;
  static const profile = _Paths.profile;
  static const home = _Paths.home;
  static const company = _Paths.company;
  static const goal = _Paths.goal;
  static const zwk = _Paths.zwk;
  static const settings = _Paths.settings;
  static const legal = _Paths.legal;
  static const help = _Paths.help;
  static const postBox = _Paths.postbox;
  static const personalData = _Paths.personalData;
  static const employmentData = _Paths.employmentData;
}

abstract class _Paths {
  _Paths._();

  static const home = '/';
  static const login = '/login';
  static const profile = '/profile';
  static const company = '/company';
  static const goal = '/goal';
  static const zwk = '/zwk';
  static const settings = 'settings';
  static const legal = 'legal';
  static const help = 'help';
  static const postbox = 'postbox';
  static const personalData = 'personalData';
  static const employmentData = 'employmentData';
}
