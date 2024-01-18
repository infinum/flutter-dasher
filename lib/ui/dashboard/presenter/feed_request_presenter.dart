import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/interactor/dashboard/fetch_feed_interactor.dart';
import 'package:flutter_dasher/ui/common/bits/request_provider/request_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final feedRequestPresenter = ChangeNotifierProvider.autoDispose<FeedRequestPresenter>(
  (ref) => FeedRequestPresenter(ref.read(fetchFeedInteractorProvider)),
);

class FeedRequestPresenter extends RequestProvider<List<Tweet>> {
  FeedRequestPresenter(this._fetchFeedInteractor) {
    fetchTweetsTimeline();
  }

  final FetchFeedInteractor _fetchFeedInteractor;

  Future<void> fetchTweetsTimeline() {
    return executeRequest(requestBuilder: _fetchFeedInteractor.fetchFeedTimeline);
  }
}
