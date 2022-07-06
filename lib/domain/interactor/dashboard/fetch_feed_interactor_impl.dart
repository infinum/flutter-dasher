import 'package:flutter_dasher/common/model/tweet.dart';
import 'package:flutter_dasher/domain/interactor/dashboard/fetch_feed_interactor.dart';
import 'package:flutter_dasher/domain/repository/feed_repository.dart';

class FetchFeedInteractorImpl implements FetchFeedInteractor {
  FetchFeedInteractorImpl(this._feedRepository);

  final FeedRepository _feedRepository;

  @override
  Future<List<Tweet>> fetchFeedTimeline() {
    return _feedRepository.fetchFeedTimeline();
  }
}
