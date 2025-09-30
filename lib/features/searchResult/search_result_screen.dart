import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_styling.dart';
import 'package:news_app/features/searchResult/services/search_result_screen_services.dart';
import 'package:news_app/generated/Local_key.g.dart';

import '../../core/widgets/spacing_widgets.dart';
import '../exploreScreen/models/article_model.dart';
import '../exploreScreen/widgets/custom_article_card_widget.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          LocaleKeys.search_result.tr(),
          style: AppStyles.black32SemiboldStyle.copyWith(fontSize: 18),
        ),
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRoutes.exploreScreen);
          },
          icon: Icon(Icons.arrow_back_outlined, size: 16),
        ),
      ),
      body: FutureBuilder(
        future: SearchResultScreenServices().searchItemByName(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.blackColor),
            );
          }
          if (snapshot.hasData) {
            ArticlesModel articlesModel =
            snapshot.data! as ArticlesModel;
            if (articlesModel.totalResults == 0) {
              return Center(child: Text(LocaleKeys.no_results.tr()));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpace(height: 27),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    itemCount: articlesModel.articles!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Article article = articlesModel.articles![index];
                      return CustomArticleCardWidget(
                        imageUrl: article.urlToImage ?? 'https://images.pexels.com/photos/158651/news-newsletter-newspaper-information-158651.jpeg?cs=srgb&dl=pexels-pixabay-158651.jpg&fm=jpg',
                        authorName: article.author ?? 'No Name',
                        title: article.title ?? 'No Title',
                        date: article.publishedAt != null ? DateFormat(
                          'yyyy-MM-dd - KK:mm',
                        ).format(article.publishedAt!) : 'No Date',
                      );
                    },
                  ),
                ),
              ],
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return Center(child: Text('error in data'));
        },
      ),
    );
  }
}
