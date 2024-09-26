import 'package:flutter/material.dart';

/*
* Created By MiraiDevs.
* On 9/26/24.
*/

/// ScrollContent is widget for you to get the height of its widget.
/// id and child is required parameter.
class ScrollContent {
  /// Name the id to get scroll position.
  final String id;

  /// scroll position is the top of child.
  final Widget child;

  ScrollContent({required this.id, required this.child});
}
