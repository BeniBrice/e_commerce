// ignore_for_file: unused_element

import 'package:e_commerce/src/auth/views/login_screen.dart';
import 'package:e_commerce/src/auth/views/registratin_screen.dart';
import 'package:e_commerce/src/categories/views/categories_page.dart';
import 'package:e_commerce/src/categories/views/categories_screen.dart';
import 'package:e_commerce/src/entrypoint/views/app_entry_point.dart';
import 'package:e_commerce/src/notification/views/notification_screen.dart';
import 'package:e_commerce/src/on_boarding/views/onboarding_screen.dart';
import 'package:e_commerce/src/products/views/product_screen.dart';
import 'package:e_commerce/src/profile/views/order_screen.dart';
import 'package:e_commerce/src/profile/views/profile_policy_screen.dart';
import 'package:e_commerce/src/profile/views/shipping_adress_screen.dart';
import 'package:e_commerce/src/search/views/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../src/splash_screen/views/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => AppEntryPoint(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnBoardingScreen(),
    ),
    // GoRoute(
    //   path: '/review',
    //   builder: (context, state) => const ReviewsPage(),
    // ),
    GoRoute(
      path: '/policy',
      builder: (context, state) => const PolicyPage(),
    ),
    // GoRoute(
    //   path: '/verification',
    //   builder: (context, state) => const VerificationPage(),
    // ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchPage(),
    ),
    // GoRoute(
    //   path: '/help',
    //   builder: (context, state) => const HelpCenterPage(),
    // ),
    GoRoute(
      path: '/orders',
      builder: (context, state) => const OrderPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegistrationPage(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => const CategoriesPage(),
    ),
    GoRoute(
      path: '/category',
      builder: (context, state) => const CategoryPage(),
    ),
    // GoRoute(
    //   path: '/addaddress',
    //   builder: (context, state) => const AddAddress(),
    // ),
    GoRoute(
      path: '/addresses',
      builder: (context, state) => const ShippingAdress(),
    ),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationPage(),
    ),
    // GoRoute(
    //   path: '/tracking',
    //   builder: (context, state) => const TrackOrderPage(),
    // ),
    // GoRoute(
    //   path: '/checkout',
    //   builder: (context, state) => const CheckoutPage(),
    // ),
    // GoRoute(
    //   path: '/successful',
    //   builder: (context, state) => const SuccessfulPayment(),
    // ),
    // GoRoute(
    //   path: '/failed',
    //   builder: (context, state) => const FailedPayment(),
    // ),
    GoRoute(
      path: '/product/:id',
      builder: (BuildContext context, GoRouterState state) {
        final productId = state.pathParameters['id'];
        return ProductPage(productId: productId.toString());
      },
    ),
  ],
);

GoRouter get router => _router;
