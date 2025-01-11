// widgets/dropdown.dart
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.hintText,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedItem,
      decoration: InputDecoration(
        labelText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 0.3, color: Colors.grey), // Border when not focused
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 1.5), // Border when focused
        ),
      ),
      items: widget.items
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ))
          .toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        widget.onChanged(newValue);
      },
      isExpanded: true,
    );
  }
}
