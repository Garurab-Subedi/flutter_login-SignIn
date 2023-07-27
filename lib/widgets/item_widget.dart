import 'package:flutter/material.dart';
import 'package:hello_app/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("Rs${item.price}",
            style: const TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
