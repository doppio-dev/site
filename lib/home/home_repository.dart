import 'package:doppio_dev_site/home/index.dart';

class HomeRepository {
  final HomeProvider _homeProvider = HomeProvider();

  HomeRepository();

  void test(bool isError) {
    _homeProvider.test(isError);
  }
}