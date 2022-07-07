import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/interactor/dashboard/fetch_feed_interactor.dart';
import 'package:flutter_dasher/ui/common/bits/request_provider/request_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final feedRequestProvider = ChangeNotifierProvider.autoDispose<FeedRequestProvider>(
  (ref) => FeedRequestProvider(GetIt.instance.get()),
);

class FeedRequestProvider extends RequestProvider<List<Tweet>> {
  FeedRequestProvider(this._feedTimelineInteractor) {
    fetchTweetsTimeline();
  }

  final FetchFeedInteractor _feedTimelineInteractor;

  Future<void> fetchTweetsTimeline() {
    return executeRequest(requestBuilder: _feedTimelineInteractor.fetchFeedTimeline);
  }
}
