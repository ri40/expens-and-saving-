import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({Key? key}) : super(key: key);

  @override
  State<ExpensePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  final items = ['Shopping','Restaurant','Cafe','Gifts','Transportation'];
  String? value;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Container(
        width: 400,
        padding: EdgeInsets.symmetric(horizontal: 12 , vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(color: Colors.green,width: 1),
        ),

        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            iconSize: 36,
            icon: Icon(Icons.keyboard_arrow_down_sharp, color: Colors.green),
            isExpanded: true,
            items: items.map(buildMenuItem).toList(),
            onChanged: (value) => setState(()=> this.value=value),
          ),
        ),
      ),
    ),
  );
  DropdownMenuItem<String>buildMenuItem(String item) =>DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
  }
