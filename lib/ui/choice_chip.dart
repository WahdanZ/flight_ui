import 'package:flutter/material.dart';

class CustomChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  CustomChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<CustomChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(.15),
              borderRadius: BorderRadius.all(Radius.circular(20)))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
