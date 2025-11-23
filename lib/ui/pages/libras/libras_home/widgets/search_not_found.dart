import 'package:flutter/material.dart';

class SearchNotFound extends StatelessWidget {
  final IconData? errorIcon;
  final String text;
  final String text2;
  final GestureTapCallback onPressed;

  const SearchNotFound({
    super.key,
    this.errorIcon,
    required this.onPressed,
    required this.text,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(errorIcon, color: Color.fromRGBO(179, 38, 30, 1)),
          SizedBox(height: 10),
          Column(
            children: [
              Text(text, style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 15),
              Text(text2, style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.secondary,
                  ),
                ),
                child: Text(
                  'Sugerir Palavra',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
