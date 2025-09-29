import 'package:dio/dio.dart';
import 'package:news_app/core/networking/dio_end_points.dart';
import 'package:news_app/core/networking/dio_helper.dart';
import '../../../core/constance/app_constance.dart';
import '../models/article_model.dart';


class ExploreScreenServices {
  getTopHeadLinesArticle()async {
    try {
      final Response response = await DioHelper.getRequest(
        endPoint: DioEndPoints.topHeadLinenEndPoint,
        query: {"apikey": AppConstance.newsApiKey, "country": 'us'},
      );

      if(response.statusCode == 200){
        ArticlesModel topHeadLiensModel = ArticlesModel.fromJson(response.data);
        return topHeadLiensModel;
      }
    } catch (e) {
      print(e.toString());
      return Future.error(e.toString());
    }
  }
}
