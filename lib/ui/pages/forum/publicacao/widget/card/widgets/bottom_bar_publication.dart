import 'package:flutter/material.dart';

class BottomBarPublication extends StatefulWidget {
  final int likes;
  final int comments;
  final bool isLiked; // já vem do backend
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;

  const BottomBarPublication({
    super.key,
    required this.likes,
    required this.comments,
    this.isLiked = false,
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

  void _toggleLike() {
    setState(() {
      if (_liked) {
        _liked = false;
        _likes--;
      } else {
        _liked = true;
        _likes++;
      }
    });

    // dispara callback para o pai salvar no backend
    widget.onLike?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 12.0),
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
                onPressed: widget.onComment,
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
