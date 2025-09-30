import 'package:dio/dio.dart';
import 'package:news_app/core/networking/dio_end_points.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import '../../../core/constance/app_constance.dart';
import '../../exploreScreen/models/article_model.dart';


class SearchResultScreenServices {
  searchItemByName(String query)async {
    try {
      final Response response = await DioHelper.getRequest(
        endPoint: DioEndPoints.searchEndPoint,
        query: {"apikey": AppConstance.newsApiKey, "q": query},
      );

      if(response.statusCode == 200){
        ArticlesModel articlesModel = ArticlesModel.fromJson(response.data);
        return articlesModel;
      }
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
