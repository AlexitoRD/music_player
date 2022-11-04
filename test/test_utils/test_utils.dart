/*
 * Author: Alexander Dunbar
 * Date: 2022-11-04, 7:50 p.m.
 */

import 'package:matcher/src/feature_matcher.dart';
import 'package:rxdart/subjects.dart';

FeatureMatcher<Subject> isClosed = _Closed();

class _Closed extends FeatureMatcher<Subject> {
  @override
  bool typedMatches(Subject item, Map matchState) {
    return item.isClosed == true;
  }
}
