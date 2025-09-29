import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/styles/app_styling.dart';
import 'package:news_app/core/widgets/spacing_widgets.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String authorName;
  final String date;
  const CustomCategoryItemWidget({
    super.key,
    this.imageUrl,
    required this.title,
    required this.authorName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl:
                imageUrl ??
                'https://images.pexels.com/photos/158651/news-newsletter-newspaper-information-158651.jpeg?cs=srgb&dl=pexels-pixabay-158651.jpg&fm=jpg',
            height: 206,
            width: 366,
            fit: BoxFit.fill,
          ),
        ),
        const HeightSpace(height: 16),
        SizedBox(
          width: 366,
          child: Text(
            title,
            style: AppStyles.black32SemiboldStyle.copyWith(fontSize: 18),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const HeightSpace(height: 12),
        Row(
          children: [
            Expanded(
              child: Text(
                '$authorName . $date',
                style: AppStyles.gray14Regular.copyWith(
                  fontSize: 12,
                  color: Color(0xff6D6265),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
