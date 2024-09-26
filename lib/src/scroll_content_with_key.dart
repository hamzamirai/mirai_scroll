import 'package:flutter/material.dart';
import 'package:mirai_scroll/mirai_scroll.dart';

/*
* Created By MiraiDevs.
* On 9/26/24.
*/

/// ScrollContentWithKey is to set new GlobalKey.
class ScrollContentWithKey {
  final Widget? child;
  final String? id;
  final GlobalKey? key;

  ScrollContentWithKey({this.child, this.key, this.id});

  factory ScrollContentWithKey.fromWithout(ScrollContent scrollContent) {
    return ScrollContentWithKey(child: scrollContent.child, id: scrollContent.id, key: GlobalKey());
  }
}
