import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wiseki_test/services/app_exceptions.dart';
import 'package:wiseki_test/services/base_response.dart';
import 'package:wiseki_test/News/model/news_model.dart';
import 'package:wiseki_test/services/network.dart';

class NetworkImpl implements Network {
  final Dio _dio;

  NetworkImpl(
    this._dio,
  );
  @override
  Future<BaseResponse<List<Result>>> getNews() async {
    try {
      final response = await _dio.get(
        'https://newsdata.io/api/1/news',
        queryParameters: {
          'apiKey': 'pub_200613bc00f4a121993df42f34ba9a057e156',
          'country': 'us,ng',
        },
      );
      print(response);
      List data = response.data['results'];
      List<Result> articles = data.map((e) => Result.fromJson(e)).toList();
      return BaseResponse(
          success: true, data: articles, message: "Data fetched successfully");
    } on DioError catch (e) {
      return AppException.handleError(e);
    }
  }
}

final newsReopository = Provider((ref) => NetworkImpl(Dio()));
