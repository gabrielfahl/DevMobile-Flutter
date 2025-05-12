import 'package:flutter/material.dart';
import 'package:myapp/ProviderTestes/contador/aula_multiprovider_count_card/state/cart.dart';
import 'package:myapp/ProviderTestes/contador/aula_multiprovider_count_card/state/count.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Cart>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Provider App (${context.watch<Count>().count})'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Total de itens: ${cart.count}'),
          ),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: cart.cart.length,
              itemBuilder: (context, index, animation) {
                final item = cart.cart[index];
                return SizeTransition(
                  sizeFactor: animation,
                  child: ListTile(
                    title: Text(item),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('addItem_floatingActionButton'),
        onPressed: () {
          final cart = context.read<Cart>();
          final newItem = 'novo item ❤';
          cart.addItem(newItem);
          _listKey.currentState?.insertItem(cart.cart.length - 1);
        },
        tooltip: 'Adicionar novo item!',
        child: const Icon(Icons.add),
      ),
    );
  }
}
