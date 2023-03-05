import 'package:flutter/material.dart';
import 'screens/detail/detail_screen.dart';
import 'screens/home/home.dart';
import 'screens/mostpopular/most_popular_screen.dart';
import 'screens/special_offers/special_offers_screen.dart';
import 'screens/test/test_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.route(): (context) => const HomeScreen(title: '123'),
  MostPopularScreen.route(): (context) => const MostPopularScreen(),
  SpecialOfferScreen.route(): (context) => const SpecialOfferScreen(),
  ShopDetailScreen.route(): (context) => const ShopDetailScreen(),
  TestScreen.route(): (context) => const TestScreen(),
};
