import 'package:flutter/material.dart';

class ContentCard extends StatefulWidget {
  final String title;
  final String content;
  final bool isCollapsible;
  final VoidCallback? onToggle;

  const ContentCard({
    super.key,
    required this.title,
    required this.content,
    this.isCollapsible = false,
    this.onToggle,
  });

  @override
  State<ContentCard> createState() => _ContentCardState();
}

class _ContentCardState extends State<ContentCard> {
  late bool _isExpanded;

  @override
  void initState() {
    _isExpanded = !widget.isCollapsible;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final textStyle = Theme.of(context).textTheme.bodyMedium;
        final textPainter = TextPainter(
          text: TextSpan(text: widget.content, style: textStyle),
          maxLines: 3,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        final bool doesTextOverflow = textPainter.didExceedMaxLines;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Text(
                widget.content,
                style: textStyle,
                maxLines: _isExpanded ? null : 3,
                overflow:
                    _isExpanded ? TextOverflow.clip : TextOverflow.ellipsis,
              ),

              if (widget.isCollapsible && doesTextOverflow)
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                    widget.onToggle?.call();
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4), // aqui diminui o arredondamento
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_isExpanded ? 'Ver menos' : 'Ver mais'),
                      const SizedBox(width: 4),
                      Icon(
                        _isExpanded ? Icons.unfold_less : Icons.unfold_more,
                        size: 20,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
