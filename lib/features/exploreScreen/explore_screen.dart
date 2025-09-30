import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_routes.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_styling.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';
import 'package:news_app/features/exploreScreen/services/explore_screen_services.dart';
import 'package:news_app/features/exploreScreen/widgets/custom_article_card_widget.dart';
import 'package:news_app/features/exploreScreen/widgets/custom_category_item_widget.dart';
import 'package:news_app/features/exploreScreen/widgets/top_items_category_explore_screen.dart';
import '../../generated/Local_key.g.dart';
import 'models/article_model.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String selectedCategory = LocaleKeys.travel.tr();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          LocaleKeys.explore.tr(),
          style: AppStyles.black32SemiboldStyle,
        ),
        toolbarHeight: 70,
        backgroundColor: AppColors.grayColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 32),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ExploreScreenServices().getTopHeadLinesArticle(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.blackColor),
            );
          }

          if (snapshot.hasData) {
            ArticlesModel topHeadLiensModel =
                snapshot.data! as ArticlesModel;
            if (topHeadLiensModel.totalResults == 0) {
              return Center(child: Text(LocaleKeys.no_results.tr()));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpace(height: 16),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 32),
                  child: SizedBox(
                    height: 40,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        TopItemsCategoryExploreScreen(
                          text: LocaleKeys.travel.tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: LocaleKeys.travel.tr(),
                            );
                            setState(() {
                              selectedCategory = LocaleKeys.travel.tr();
                            });
                          },
                          isSelected:
                              selectedCategory == LocaleKeys.travel.tr(),
                        ),
                        TopItemsCategoryExploreScreen(
                          text: LocaleKeys.technology.tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: LocaleKeys.technology.tr(),
                            );
                            setState(() {
                              selectedCategory = LocaleKeys.technology.tr();
                            });
                          },
                          isSelected:
                              selectedCategory == LocaleKeys.technology.tr(),
                        ),
                        TopItemsCategoryExploreScreen(
                          text: LocaleKeys.business.tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: LocaleKeys.business.tr(),
                            );
                            setState(() {
                              selectedCategory = LocaleKeys.business.tr();
                            });
                          },
                          isSelected:
                              selectedCategory == LocaleKeys.business.tr(),
                        ),
                        TopItemsCategoryExploreScreen(
                          text: LocaleKeys.entertainment.tr(),
                          onTap: () {
                            GoRouter.of(context).pushNamed(
                              AppRoutes.searchResultScreen,
                              extra: LocaleKeys.entertainment.tr(),
                            );

                            setState(() {
                              selectedCategory = LocaleKeys.entertainment.tr();
                            });
                          },
                          isSelected:
                              selectedCategory == LocaleKeys.entertainment.tr(),
                        ),
                      ],
                    ),
                  ),
                ),

                const HeightSpace(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: CustomCategoryItemWidget(
                    imageUrl:
                        (topHeadLiensModel
                                    .articles![0]
                                    .urlToImage
                                    ?.isNotEmpty ??
                                false)
                            ? topHeadLiensModel.articles![0].urlToImage
                            : 'https://images.pexels.com/photos/158651/news-newsletter-newspaper-information-158651.jpeg?cs=srgb&dl=pexels-pixabay-158651.jpg&fm=jpg',
                    title: topHeadLiensModel.articles![0].title ?? 'No Title',
                    authorName:
                        topHeadLiensModel.articles![0].author ?? 'No Name',
                    date:
                        topHeadLiensModel.articles![0].publishedAt != null
                            ? DateFormat('yyyy-MM-dd - KK:mm').format(
                              topHeadLiensModel.articles![0].publishedAt!,
                            )
                            : 'No Date',
                  ),
                ),

                const HeightSpace(height: 24),

                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    itemCount: topHeadLiensModel.articles!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Article article = topHeadLiensModel.articles![index];
                      return CustomArticleCardWidget(
                        imageUrl:
                            article.urlToImage ??
                            'https://images.pexels.com/photos/158651/news-newsletter-newspaper-information-158651.jpeg?cs=srgb&dl=pexels-pixabay-158651.jpg&fm=jpg',
                        authorName: article.author ?? 'No Name',
                        title: article.title ?? 'No Title',
                        date:
                            article.publishedAt != null
                                ? DateFormat(
                                  'yyyy-MM-dd - KK:mm',
                                ).format(article.publishedAt!)
                                : 'No Date',
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
