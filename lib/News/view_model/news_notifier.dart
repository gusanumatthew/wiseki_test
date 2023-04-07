import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wiseki_test/News/view_model/news_state.dart';
import 'package:wiseki_test/services/network_impl.dart';
import 'package:wiseki_test/utils/enums.dart';
import 'package:wiseki_test/utils/logger.dart';

class NewsNotifier extends StateNotifier<NewsState> {
  NewsNotifier(this._ref) : super(NewsState.initial());
  final Ref _ref;

  Future<void> getNews() async {
    try {
      final response = await _ref.read(newsReopository).getNews();
      print(response);
      if (response.success) {
        state = state.copyWith(
            loadState: NetworkState.success, articles: response.data);
        return;
      }
      state = state.copyWith(
          loadState: NetworkState.error, errorMessage: response.message);
    } catch (e) {
      debugLog(e);
      state = state.copyWith(
          loadState: NetworkState.error, errorMessage: e.toString());
    }
  }
}

final newsProvider = StateNotifierProvider<NewsNotifier, NewsState>(
  (ref) => NewsNotifier(ref),
);
