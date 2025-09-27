import 'package:flutter/material.dart';
import 'package:news_app/core/styles/app_styling.dart';

import '../../../core/styles/app_colors.dart';

class TopItemsCategoryExploreScreen extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function() onTap;
  const TopItemsCategoryExploreScreen({
    super.key,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: OutlinedButton(
        clipBehavior: Clip.hardEdge,
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.grayColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56),
          ),
          backgroundColor: isSelected ? AppColors.grayColor : AppColors.whiteColor,

        ),
        child: Text(
          text,
          style: AppStyles.black32SemiboldStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../../../core/styles/app_colors.dart';
// import '../../../core/styles/app_styling.dart';
//
// class TopItemsCategoryExploreScreen extends StatelessWidget {
//   final String text;
//   final bool isSelected;
//   final VoidCallback onTap;
//
//   const TopItemsCategoryExploreScreen({
//     super.key,
//     required this.text,
//     required this.isSelected,
//     required this.onTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 12),
//         padding: EdgeInsets.symmetric(horizontal: 24, vertical: 6),
//         decoration: BoxDecoration(
//           color: isSelected ? AppColors.grayColor : Colors.transparent, // خلفية عند التحديد
//           border: Border.all(
//             color:  AppColors.grayColor,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Text(
//           text,
//           style: AppStyles.black32SemiboldStyle.copyWith(
//             fontSize: 16,
//             color: AppColors.blackColor, // لون النص
//           ),
//         ),
//       ),
//     );
//   }
// }
//
