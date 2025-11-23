import 'package:flutter/material.dart';
import 'package:if_inclusivo/ui/pages/libras/management_libras/widgets/libras_tile.dart';
import 'package:if_inclusivo/ui/pages/libras/management_libras/widgets/row_title.dart';

class ManagementPage extends StatefulWidget {
  const ManagementPage({super.key});

  @override
  State<ManagementPage> createState() => _ManagementPageState();
}

class _ManagementPageState extends State<ManagementPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return SafeArea(child:
    Scaffold(
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Text('Converte Libras', style: textTheme.headlineLarge, textAlign: TextAlign.center,),
          ),
          Card(
            color: colorScheme.surfaceContainerLow,
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 50),
            child:ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 1000),
              child: Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 45, bottom: 45),
                child: Column(
                  children: [
                    RowTitle(),
                    LibrasTile.aprovado(palavra: 'palavra', onView: (){}, onEdite: (){}, onDelete: (){},fill: true,),
                    LibrasTile.emAnalise(palavra: 'palavra', onAprove: (){}, onDisapprove: (){},),
                    LibrasTile.aprovado(palavra: 'palavra', onView: (){}, onEdite: (){}, onDelete: (){},fill: true,),


                  ],
                ),
              ),
            ) ,
          )
        ],
      ),
    ));
  }
}
