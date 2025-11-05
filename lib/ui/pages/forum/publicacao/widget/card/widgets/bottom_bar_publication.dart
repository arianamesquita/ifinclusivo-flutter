import 'package:flutter/material.dart';

import '../../../../../auth/modal/auth_modals.dart';

class BottomBarPublication extends StatefulWidget {
  final int likes;
  final int comments;
  final bool isLiked;
  final bool isLoggedIn;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;

  const BottomBarPublication({
    super.key,
    required this.likes,
    required this.comments,
    this.isLiked = false,
    required this.isLoggedIn ,
    this.onLike,
    this.onComment,
    this.onShare,
  });

  @override
  State<BottomBarPublication> createState() => _BottomBarPublicationState();
}

class _BottomBarPublicationState extends State<BottomBarPublication> {
  late bool _liked;
  late int _likes;

  @override
  void initState() {
    super.initState();
    _liked = widget.isLiked;
    _likes = widget.likes;
  }

  @override
  void didUpdateWidget(covariant BottomBarPublication oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isLiked != oldWidget.isLiked) {
      _liked = widget.isLiked;
    }
    if (widget.likes != oldWidget.likes) {
      _likes = widget.likes;
    }
  }

  void _toggleLike() {
    if (!widget.isLoggedIn) {
      showLoginRequiredDialog(context);
      return;
    }

    // comportamento otimista
    setState(() {
      if (_liked) {
        _liked = false;
        _likes--;
      } else {
        _liked = true;
        _likes++;
      }
    });

    widget.onLike?.call(); // callback pro backend
  }

  void _handleComment() {
    if (!widget.isLoggedIn) {
      showLoginRequiredDialog(context);
      return;
    }
    widget.onComment?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 12,
            children: [
              TextButton.icon(
                onPressed: _toggleLike,
                icon: Icon(
                  _liked
                      ? Icons.favorite_rounded
                      : Icons.favorite_outline_rounded,
                  color: _liked
                      ? Theme.of(context).colorScheme.error
                      : null,
                ),
                label: Text(_likes.toString()),
              ),
              TextButton.icon(
                onPressed: _handleComment,
                icon: const Icon(Icons.insert_comment_outlined),
                label: Text(widget.comments.toString()),
              ),
            ],
          ),
          IconButton(
            onPressed: widget.onShare,
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
    );
  }
}
