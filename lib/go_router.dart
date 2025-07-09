import 'package:bai1/app/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/app_link_hosting',
      builder: (context, state) =>  Scaffold(body: Text('data'),),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) {
        return HomeScreen();
      },
    ),
  ],
);

