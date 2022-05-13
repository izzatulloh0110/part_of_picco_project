import 'package:flutter/material.dart';
import 'package:part_of_picco_project/model/facility_model.dart';

class ItemsList extends StatefulWidget {
  final Facility facility;

  const ItemsList({Key? key, required this.facility}) : super(key: key);

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.facility.name),
      trailing: Checkbox(
        value: widget.facility.isChecked,
        activeColor: const Color(0xFF4F4E9A),
        onChanged: (value) {
          setState(() {
            widget.facility.isChecked = value ?? false;
          });
        },
      ),
    );
  }
}