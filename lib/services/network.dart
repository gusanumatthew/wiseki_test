import 'package:wiseki_test/News/model/news_model.dart';
import 'package:wiseki_test/services/base_response.dart';

abstract class Network {
  Future<BaseResponse<List<Result>>> getNews();
}
