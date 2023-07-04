import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridViewWidget extends StatefulWidget {
  GridViewWidget({super.key, this.height, this.width});

  double? height, width;

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  dynamic borderRadius = const Radius.circular(20);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      margin: const EdgeInsets.all(40),
      child: GridView.count(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 25, // Spacing between columns
        mainAxisSpacing: 25, // Spacing between rows
        padding: const EdgeInsets.all(10.0), // Padding for the grid view
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(borderRadius)),
            child: const Center(child: Text('Item 1')),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(borderRadius)),
            child: const Center(child: Text('Item 2')),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(borderRadius)),
            child: const Center(child: Text('Item 3')),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.all(borderRadius)),
            child: const Center(child: Text('Item 4')),
          ),
        ],
      ),
    );
  }
}
