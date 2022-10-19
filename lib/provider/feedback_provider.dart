

import 'package:flutter/cupertino.dart';

import '../services/post_feedback.dart';

class FeedbackProvider extends ChangeNotifier{
  String rentof = '';

  Future<void> postFeedback(
      String rate,
      String description
      ) async {
    await FeedbackPost().postFeedback(rate: rate, description: description);
  }


}