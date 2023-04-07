import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wiseki_test/News/view_model/news_notifier.dart';
import 'package:wiseki_test/News/views/view_more.dart';
import 'package:wiseki_test/utils/enums.dart';

class NewsView extends ConsumerStatefulWidget {
  const NewsView({super.key});

  @override
  ConsumerState<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends ConsumerState<NewsView> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(newsProvider.notifier);
    notifier.getNews();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(newsProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            state.loadState == NetworkState.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: state.articles.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ViewMore(
                              init: state.articles[index].link,
                            ),
                          ),
                        ),
                        child: ListTile(
                          // leading: Image.network(state.articles[index].imageUrl!),
                          title: Text(state.articles[index].title),
                        ),
                      );
                    })
          ],
        ),
      ),
    );
  }
}
