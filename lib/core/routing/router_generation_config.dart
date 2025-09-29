import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/exploreScreen/explore_screen.dart';
import '../../features/searchResult/search_result_screen.dart';
import 'app_routes.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.exploreScreen,
    errorBuilder: (_, _) {
      return Scaffold(
        body: Center(
          child: Text(
            'This Route is not found',
            //style: AppStyles.black16MediumStyle,
          ),
        ),
      );
    },
    routes: [
      GoRoute(
        path: AppRoutes.exploreScreen,
        name: AppRoutes.exploreScreen,
        builder: (_, _) {
          return const ExploreScreen();
        },
      ),
      GoRoute(
        path: AppRoutes.searchScreen,
        name: AppRoutes.searchScreen,
        builder: (_, _) {
          return Container();
        },
      ),
      GoRoute(
        path: AppRoutes.searchResultScreen,
        name: AppRoutes.searchResultScreen,
        builder: (_, state) {
          String query = state.extra as String;
          return SearchResultScreen(query: query,);
        },
      ),
      GoRoute(
        path: AppRoutes.articleDetailsScreen,
        name: AppRoutes.articleDetailsScreen,
        builder: (_, _) {
          return Container();
        },
      ),
    ],
  );
}
