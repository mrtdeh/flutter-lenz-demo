import 'package:flutter/material.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({
    this.iconData,
    this.page,
    //this.text,
  });

  IconData iconData;
  String page;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    // this.navstate,
    this.items,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.onTabSelected,
  }) {
    assert(this.items.length == 5 || this.items.length == 4);
  }
  // final NavigatorState navstate;
  final List<FABBottomAppBarItem> items;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        context: context,
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 20,
          color: Colors.black,
        ),
      ], color: Colors.white),
      child: BottomAppBar(
        // shape: CircularNotchedRectangle(),

        elevation: 1,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items,
        ),
        color: widget.backgroundColor,
      ),
    );
  }

  Widget _buildTabItem(
      {BuildContext context,
      FABBottomAppBarItem item,
      int index,
      ValueChanged<int> onPressed}) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              onPressed(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
