import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchNotFound extends StatelessWidget {
  final IconData errorIcon;
  final String text = 'Não encontramos esta palavra.';
  final String text2 = 'Nos ajude a melhorar nosso glossário!';
  final GestureTapCallback onPressed;

  const SearchNotFound({super.key, required this.errorIcon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(errorIcon, color: Color.fromRGBO(179,38,30, 1)),
          SizedBox(height: 10,),
        Column(
          children: [
            Text(text, style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: 15,),
            Text(text2, style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: 25,),
            ElevatedButton(onPressed: onPressed, child: Text('Sugerir Palavra'),),
          ],
        )
      ],),
    );
  }
}
