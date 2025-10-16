import 'package:flutter/material.dart';

import '../../../../../../../utils/date_utils.dart';

class UserInfoComment extends StatelessWidget {
  final String userName;
  final String? taggedUser;
  final DateTime dateCreation;

  const UserInfoComment({super.key, required this.userName,required this.taggedUser, required this.dateCreation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 5,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment:
          WrapCrossAlignment.center,
          children: [
            Text(
              userName,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color:
                Theme.of(
                  context,
                ).colorScheme.onSurface,
              ),
            ),
            Text(
              formatTimeAgo(
                dateCreation,
              ),
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(
                color:
                Theme.of(
                  context,
                ).colorScheme.onSurfaceVariant,
              ),
              softWrap: true,
              maxLines: 2,
            ),
          ],
        ),
        if (taggedUser != null)
          Wrap(
            spacing: 5,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment:
            WrapCrossAlignment.center,
            children: [
              Icon(Icons.subdirectory_arrow_right),
              Text('respondeu a: '),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      spacing: 3,
                      children: [
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: CircleAvatar(),
                        ),
                        Text(taggedUser!
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
