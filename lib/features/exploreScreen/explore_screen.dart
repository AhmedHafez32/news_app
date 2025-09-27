import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/styles/app_colors.dart';
import 'package:news_app/core/styles/app_styling.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';
import 'package:news_app/features/exploreScreen/widgets/top_items_category_explore_screen.dart';

import '../../generated/Local_key.g.dart';

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
        title: Text(
          LocaleKeys.explore.tr(),
          style: AppStyles.black32SemiboldStyle,
        ),
        toolbarHeight: 70,
        backgroundColor: AppColors.grayColor,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 32)),
        ],
      ),
      body: Column(
        children: [
          HeightSpace(height: 16),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 32),
            child: SizedBox(
              height: 40,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                // padding: EdgeInsets.symmetric(horizontal: 12),
                children: [
                  TopItemsCategoryExploreScreen(
                    text: LocaleKeys.travel.tr(),
                    onTap: () {
                      setState(() {
                        selectedCategory = LocaleKeys.travel.tr();
                      });
                    },
                    isSelected: selectedCategory == LocaleKeys.travel.tr(),
                  ),
                  TopItemsCategoryExploreScreen(
                    text: LocaleKeys.technology.tr(),
                    onTap: () {
                      setState(() {
                        selectedCategory = LocaleKeys.technology.tr();
                      });
                    },
                    isSelected: selectedCategory == LocaleKeys.technology.tr(),
                  ),
                  TopItemsCategoryExploreScreen(
                    text: LocaleKeys.business.tr(),
                    onTap: () {
                      setState(() {
                        selectedCategory = LocaleKeys.business.tr();
                      });
                    },
                    isSelected: selectedCategory == LocaleKeys.business.tr(),
                  ),
                  TopItemsCategoryExploreScreen(
                    text: LocaleKeys.entertainment.tr(),
                    onTap: () {
                      setState(() {
                        selectedCategory = LocaleKeys.entertainment.tr();
                      });
                    },
                    isSelected: selectedCategory == LocaleKeys.entertainment.tr(),
                  ),
                  // TopItemsCategoryExploreScreen(
                  //   text: LocaleKeys.travel.tr(),
                  //   isSelected: selectedCategory == LocaleKeys.travel.tr(),
                  //   onTap: () {
                  //     setState(() {
                  //       selectedCategory = LocaleKeys.travel.tr();
                  //     });
                  //   },
                  // ),
                  // TopItemsCategoryExploreScreen(
                  //   text: LocaleKeys.business.tr(),
                  //   isSelected: selectedCategory == LocaleKeys.business.tr(),
                  //   onTap: () {
                  //     setState(() {
                  //       selectedCategory = LocaleKeys.business.tr();
                  //     });
                  //   },
                  // ),
                  // TopItemsCategoryExploreScreen(
                  //   text: LocaleKeys.technology.tr(),
                  //   isSelected: selectedCategory == LocaleKeys.technology.tr(),
                  //   onTap: () {
                  //     setState(() {
                  //       selectedCategory = LocaleKeys.technology.tr();
                  //     });
                  //   },
                  // ),
                  // TopItemsCategoryExploreScreen(
                  //   text: LocaleKeys.entertainment.tr(),
                  //   isSelected: selectedCategory == LocaleKeys.entertainment.tr(),
                  //   onTap: () {
                  //     setState(() {
                  //       selectedCategory = LocaleKeys.entertainment.tr();
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
