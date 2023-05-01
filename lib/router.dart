import 'package:flutter/material.dart';
import 'package:quizlee/features/auth/views/login_screen.dart';
import 'package:quizlee/features/base_nav/dummy_home.dart';
import 'package:quizlee/features/base_nav/dummy_home2.dart';
import 'package:routemaster/routemaster.dart';

//! these routes would be desplayed when the user is logged out
final loggedOutRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: LoginScreen(),
        ),
  },
  onUnknownRoute: (path) => const MaterialPage(
    child: DummyHome(),
  ),
);

//! these routes would be displayed when the user is logged in as an employee
final loggedInRoute = RouteMap(
  routes: {
    '/': (_) => const MaterialPage(
          child: DummyHome(),
        ),
    // '/product-details/:productId': (routeData) => MaterialPage(
    //       child: BuyerProductDetailsView(
    //         productId: routeData.pathParameters['productId']!,
    //       ),
    //     ),
  },
  onUnknownRoute: (path) => const MaterialPage(
    child: DummyHome2(),
  ),
);
