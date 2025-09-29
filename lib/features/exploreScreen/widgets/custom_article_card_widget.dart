import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/styles/app_styling.dart';
import '../../../core/widgets/spacing_widgets.dart';

class CustomArticleCardWidget extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String authorName;
  final String date;
  const CustomArticleCardWidget({
    super.key,
    this.imageUrl,
    required this.title,
    required this.authorName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 238,
                child: Column(
                  children: [
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      title,
                      style: AppStyles.black32SemiboldStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpace(height: 12),
              Row(
                children: [
                  SizedBox(
                    width: 238,
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
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              placeholder: (_, _) => CircularProgressIndicator(),
              errorWidget: (_, _, _) => Icon(Icons.broken_image),
              imageUrl:
                  imageUrl ??
                  'https://images.pexels.com/photos/158651/news-newsletter-newspaper-information-158651.jpeg?cs=srgb&dl=pexels-pixabay-158651.jpg&fm=jpg',
              height: 80,
              width: 112,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
