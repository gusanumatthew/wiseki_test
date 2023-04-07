import 'package:wiseki_test/News/model/news_model.dart';
import 'package:wiseki_test/utils/enums.dart';

class NewsState {
  final NetworkState loadState;
  final String errorMessage;
  final List<Result> articles;

  NewsState(
      {required this.loadState,
      required this.errorMessage,
      required this.articles});

  factory NewsState.initial() {
    return NewsState(
      loadState: NetworkState.loading,
      errorMessage: '',
      articles: [],
    );
  }

  NewsState copyWith(
      {NetworkState? loadState, String? errorMessage, List<Result>? articles}) {
    return NewsState(
      loadState: loadState ?? this.loadState,
      errorMessage: errorMessage ?? this.errorMessage,
      articles: articles ?? this.articles,
    );
  }
}
