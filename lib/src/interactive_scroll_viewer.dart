import 'package:flutter/material.dart';

import '../mirai_scroll.dart';
import 'scroll_content_with_key.dart';

/*
* Created By MiraiDevs.
* On 9/26/24.
*/

/// InteractiveScrollViewer is required widget for using scroll_to_id.
/// This widget is customized version of 'SingleChildScrollView'.
/// children and scrollToId is required parameter.
class InteractiveScrollViewer extends StatefulWidget {
  final ScrollToId? scrollToId;
  final List<ScrollContent> children;

  /// The axis along which the scroll view scrolls.
  /// Defaults to [Axis.vertical].
  final Axis scrollDirection;

  const InteractiveScrollViewer({
    super.key,
    required this.children,
    required this.scrollToId,
    this.scrollDirection = Axis.vertical,
  });

  @override
  State<InteractiveScrollViewer> createState() => _InteractiveScrollViewerState();
}

class _InteractiveScrollViewerState extends State<InteractiveScrollViewer> {
  final List<String> _idList = [];

  @override
  void initState() {
    super.initState();

    /// Set scrollDirection
    widget.scrollToId!.scrollDirection = widget.scrollDirection;

    /// Convert ScrollContent to ScrollContentWithKey
    for (ScrollContent scrollContents in widget.children) {
      if (_idList.contains(scrollContents.id)) {
        throw Exception('Do not use the same id');
      } else {
        _idList.add(scrollContents.id);
      }
      widget.scrollToId!.scrollContentsList.add(ScrollContentWithKey.fromWithout(scrollContents));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: widget.scrollDirection,
      controller: widget.scrollToId!.scrollController,
      child: buildContent(),
    );
  }

  Widget buildContent() {
    /// Default
    if (widget.scrollDirection == Axis.vertical) {
      return Column(
        children: widget.scrollToId!.scrollContentsList.map((scrollContents) {
          return buildRepaintBoundary(scrollContents);
        }).toList(),
      );
    } else {
      return Row(
        children: widget.scrollToId!.scrollContentsList.map((scrollContents) {
          return buildRepaintBoundary(scrollContents);
        }).toList(),
      );
    }
  }

  /// This widget is to get the size of its widget.
  RepaintBoundary buildRepaintBoundary(ScrollContentWithKey scrollContents) {
    return RepaintBoundary(
      key: scrollContents.key,
      child: scrollContents.child,
    );
  }
}
