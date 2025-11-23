import 'package:flutter/material.dart';

class RowTitle extends StatelessWidget {
  const RowTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 23.0, horizontal: 16),

      child: Row(
        children: [
          Expanded(
            child: Text(
              'Palavra',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            child: Text(
              'Status',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(
            width: 155,
            child: Text(
              'Acões',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}
