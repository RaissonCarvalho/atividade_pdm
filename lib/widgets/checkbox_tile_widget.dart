import 'package:flutter/material.dart';
import 'package:pdm_05/models/Item.dart';

class CheckBoxTileWidget extends StatefulWidget {
  const CheckBoxTileWidget({super.key});

  @override
  State<CheckBoxTileWidget> createState() => _CheckBoxTileWidgetState();
}

class _CheckBoxTileWidgetState extends State<CheckBoxTileWidget> {
  final List<Item> _items = [
    Item(title: 'Arroz'),
    Item(title: 'Feijão'),
    Item(title: 'Carne'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (BuildContext context, int index) {
        return CheckboxListTile(
          title: Text(_items[index].title),
          value: _items[index].isSelected,
          onChanged: (bool? value) {
            setState(() {
              _items[index].isSelected = value!;
            });
          },
        );
      },
    );
  }
}
